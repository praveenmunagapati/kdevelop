/***************************************************************************
 *   Copyright (C) 2007 by Robert Gruber                                   *
 *   rgruber@users.sourceforge.net                                         *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#include "cvsproxy.h"

#include <QFileInfo>
#include <QDir>
#include <KLocale>
#include <KUrl>
#include <KMessageBox>
#include <K3Process>

#include "cvspart.h"
#include "cvsjob.h"


CvsProxy::CvsProxy(CvsPart* part)
: QObject(part), m_part(part)
{
}

CvsProxy::~CvsProxy()
{
    kDebug()<<  k_funcinfo <<endl;
}

void CvsProxy::slotResult(KJob* job)
{
    job->deleteLater();
}

bool CvsProxy::prepareJob(CvsJob* job, const QString& repository)
{
    if (!m_part->isValidDirectory(repository)) {
        kDebug() << repository << " is not a valid CVS repository" << endl;
        return false;
    }

    // clear commands and args from a possible previous run
    job->clear();

    // setup the working directory for the new job
    job->setDirectory(repository);

    // each job that was connected by this proxy class will
    // automatically be delete after it has finished.
    // Therefor the slotResult() calls deleteLater() on the job
    connect(job, SIGNAL( result(KJob*) ),
            this, SLOT( slotResult(KJob*) ));

    return true;
}

bool CvsProxy::addFileList(CvsJob* job, const QString& repository, const KUrl::List& urls)
{
    foreach(KUrl url, urls) {
        //@todo this is ok for now, but what if some of the urls are not
	//      to the given repository
        QString file = KUrl::relativeUrl(repository + QDir::separator(), url);

        *job << K3Process::quote( file );
    }

    return true;
}

CvsJob* CvsProxy::log(const KUrl& url)
{
    kDebug() << k_funcinfo << endl;

    QFileInfo info(url.path());
    if (!info.isFile())
        return false;

    CvsJob* job = new CvsJob(this);
    if ( prepareJob(job, info.absolutePath()) ) {
        *job << "cvs";
        *job << "log";
        *job << K3Process::quote(info.fileName());

        return job;
    }
    if (job) delete job;
    return NULL;
}

CvsJob* CvsProxy::diff(const KUrl& url, const QString& diffOptions,
                    const QString& revA, const QString& revB)
{
    kDebug() << k_funcinfo << endl;

    QFileInfo info(url.path());

    CvsJob* job = new CvsJob(this);
    if ( prepareJob(job, info.absolutePath()) ) {
        *job << "cvs";
        *job << "diff";
        *job << diffOptions;

        if (!revA.isEmpty())
            *job << "-r"<<K3Process::quote(revA);
        if (!revB.isEmpty())
            *job << "-r"<<K3Process::quote(revB);

        *job << K3Process::quote(info.fileName());

        return job;
    }
    if (job) delete job;
    return NULL;
}

CvsJob* CvsProxy::edit(const QString& repo, const KUrl::List& files)
{
    kDebug() << k_funcinfo << endl;

    CvsJob* job = new CvsJob(this);
    if ( prepareJob(job, repo) ) {
        *job << "cvs";
        *job << "edit";

        addFileList(job, repo, files);

        return job;
    }
    if (job) delete job;
    return NULL;
}


CvsJob* CvsProxy::unedit(const QString& repo, const KUrl::List& files)
{
    kDebug() << k_funcinfo << endl;

    CvsJob* job = new CvsJob(this);
    if ( prepareJob(job, repo) ) {
        *job << "cvs";
        *job << "unedit";

        addFileList(job, repo, files);

        return job;
    }
    if (job) delete job;
    return NULL;
}

CvsJob* CvsProxy::editors(const QString& repo, const KUrl::List& files)
{
    kDebug() << k_funcinfo << endl;

    CvsJob* job = new CvsJob(this);
    if ( prepareJob(job, repo) ) {
        *job << "cvs";
        *job << "editors";

        addFileList(job, repo, files);

        return job;
    }
    if (job) delete job;
    return NULL;
}

CvsJob* CvsProxy::commit(const QString& repo, const KUrl::List& files, const QString& message)
{
    kDebug() << k_funcinfo << endl;

    CvsJob* job = new CvsJob(this);
    if ( prepareJob(job, repo) ) {
        *job << "cvs";
        *job << "commit";

        *job << "-m";
        *job << K3Process::quote( message );

        addFileList(job, repo, files);

        return job;
    }
    if (job) delete job;
    return NULL;
}

CvsJob* CvsProxy::add(const QString & repo, const KUrl::List & files, bool binary)
{
    kDebug() << k_funcinfo << endl;

    CvsJob* job = new CvsJob(this);
    if ( prepareJob(job, repo) ) {
        *job << "cvs";
        *job << "add";

        if (binary) {
            *job << "-kb";
        }

        addFileList(job, repo, files);

        return job;
    }
    if (job) delete job;
    return NULL;
}

CvsJob* CvsProxy::update(const QString & repo, const KUrl::List & files,
                      const QString & updateOptions, bool pruneDirs, bool createDirs)
{
    kDebug() << k_funcinfo << endl;

    CvsJob* job = new CvsJob(this);
    if ( prepareJob(job, repo) ) {
        *job << "cvs";
        *job << "update";

        if (pruneDirs)
            *job << "-P";
        if (createDirs)
            *job << "-d";
        if (!updateOptions.isEmpty())
            *job << updateOptions;

        addFileList(job, repo, files);

        return job;
    }
    if (job) delete job;
    return NULL;
}

#include "cvsproxy.moc"
//kate: space-indent on; indent-width 4; replace-tabs on; auto-insert-doxygen on; indent-mode cstyle;
