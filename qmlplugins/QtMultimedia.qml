import Builtins1 1.0
import QtAudioEngine 1.0
import QtBluetooth 1.0

// This file describes the plugin-supplied types contained in the library.
// It is used for QML tooling purposes only.
//
// This file was auto-generated with the command 'qmlplugindump -notrelocatable QtMultimedia 5.0'.

Module {
    Component {
        name: "QCamera"
        prototype: "QMediaObject"
        Enum {
            name: "Status"
            values: {
                "UnavailableStatus": 0,
                "UnloadedStatus": 1,
                "LoadingStatus": 2,
                "UnloadingStatus": 3,
                "LoadedStatus": 4,
                "StandbyStatus": 5,
                "StartingStatus": 6,
                "StoppingStatus": 7,
                "ActiveStatus": 8
            }
        }
        Enum {
            name: "State"
            values: {
                "UnloadedState": 0,
                "LoadedState": 1,
                "ActiveState": 2
            }
        }
        Enum {
            name: "CaptureMode"
            values: {
                "CaptureViewfinder": 0,
                "CaptureStillImage": 1,
                "CaptureVideo": 2
            }
        }
        Enum {
            name: "Error"
            values: {
                "NoError": 0,
                "CameraError": 1,
                "InvalidRequestError": 2,
                "ServiceMissingError": 3,
                "NotSupportedFeatureError": 4
            }
        }
        Enum {
            name: "LockStatus"
            values: {
                "Unlocked": 0,
                "Searching": 1,
                "Locked": 2
            }
        }
        Enum {
            name: "LockChangeReason"
            values: {
                "UserRequest": 0,
                "LockAcquired": 1,
                "LockFailed": 2,
                "LockLost": 3,
                "LockTemporaryLost": 4
            }
        }
        Enum {
            name: "LockType"
            values: {
                "NoLock": 0,
                "LockExposure": 1,
                "LockWhiteBalance": 2,
                "LockFocus": 4
            }
        }
        Property { name: "state"; type: "QCamera::State"; isReadonly: true }
        Property { name: "status"; type: "QCamera::Status"; isReadonly: true }
        Property { name: "captureMode"; type: "QCamera::CaptureModes" }
        Property { name: "lockStatus"; type: "QCamera::LockStatus"; isReadonly: true }
        Signal {
            name: "stateChanged"
            Parameter { type: "QCamera::State" }
        }
        Signal {
            name: "captureModeChanged"
            Parameter { type: "QCamera::CaptureModes" }
        }
        Signal {
            name: "statusChanged"
            Parameter { type: "QCamera::Status" }
        }
        Signal { name: "locked" }
        Signal { name: "lockFailed" }
        Signal {
            name: "lockStatusChanged"
            Parameter { type: "QCamera::LockStatus" }
            Parameter { type: "QCamera::LockChangeReason" }
        }
        Signal {
            name: "lockStatusChanged"
            Parameter { type: "QCamera::LockType" }
            Parameter { type: "QCamera::LockStatus" }
            Parameter { type: "QCamera::LockChangeReason" }
        }
        Signal {
            name: "error"
            Parameter { type: "QCamera::Error" }
        }
        Method {
            name: "setCaptureMode"
            Parameter { name: "mode"; type: "QCamera::CaptureModes" }
        }
        Method { name: "load" }
        Method { name: "unload" }
        Method { name: "start" }
        Method { name: "stop" }
        Method { name: "searchAndLock" }
        Method { name: "unlock" }
        Method {
            name: "searchAndLock"
            Parameter { name: "locks"; type: "QCamera::LockTypes" }
        }
        Method {
            name: "unlock"
            Parameter { name: "locks"; type: "QCamera::LockTypes" }
        }
    }
    Component {
        name: "QDeclarativeAudio"
        prototype: "QObject"
        exports: ["QtMultimedia/Audio 5.0", "QtMultimedia/MediaPlayer 5.0"]
        exportMetaObjectRevisions: [0, 0]
        Enum {
            name: "Status"
            values: {
                "UnknownStatus": 0,
                "NoMedia": 1,
                "Loading": 2,
                "Loaded": 3,
                "Stalled": 4,
                "Buffering": 5,
                "Buffered": 6,
                "EndOfMedia": 7,
                "InvalidMedia": 8
            }
        }
        Enum {
            name: "Error"
            values: {
                "NoError": 0,
                "ResourceError": 1,
                "FormatError": 2,
                "NetworkError": 3,
                "AccessDenied": 4,
                "ServiceMissing": 5
            }
        }
        Enum {
            name: "Loop"
            values: {
                "Infinite": -1
            }
        }
        Enum {
            name: "PlaybackState"
            values: {
                "PlayingState": 1,
                "PausedState": 2,
                "StoppedState": 0
            }
        }
        Enum {
            name: "Availability"
            values: {
                "Available": 0,
                "Busy": 2,
                "Unavailable": 1,
                "ResourceMissing": 3
            }
        }
        Property { name: "source"; type: "QUrl" }
        Property { name: "loops"; type: "int" }
        Property { name: "playbackState"; type: "PlaybackState"; isReadonly: true }
        Property { name: "autoPlay"; type: "bool" }
        Property { name: "autoLoad"; type: "bool" }
        Property { name: "status"; type: "Status"; isReadonly: true }
        Property { name: "duration"; type: "int"; isReadonly: true }
        Property { name: "position"; type: "int"; isReadonly: true }
        Property { name: "volume"; type: "double" }
        Property { name: "muted"; type: "bool" }
        Property { name: "hasAudio"; type: "bool"; isReadonly: true }
        Property { name: "hasVideo"; type: "bool"; isReadonly: true }
        Property { name: "bufferProgress"; type: "double"; isReadonly: true }
        Property { name: "seekable"; type: "bool"; isReadonly: true }
        Property { name: "playbackRate"; type: "double" }
        Property { name: "error"; type: "Error"; isReadonly: true }
        Property { name: "errorString"; type: "string"; isReadonly: true }
        Property {
            name: "metaData"
            type: "QDeclarativeMediaMetaData"
            isReadonly: true
            isPointer: true
        }
        Property { name: "mediaObject"; type: "QObject"; isReadonly: true; isPointer: true }
        Property { name: "availability"; type: "Availability"; isReadonly: true }
        Signal { name: "loopCountChanged" }
        Signal { name: "paused" }
        Signal { name: "stopped" }
        Signal { name: "playing" }
        Signal {
            name: "availabilityChanged"
            Parameter { name: "availability"; type: "Availability" }
        }
        Signal {
            name: "error"
            Parameter { name: "error"; type: "QDeclarativeAudio::Error" }
            Parameter { name: "errorString"; type: "string" }
        }
        Method { name: "play" }
        Method { name: "pause" }
        Method { name: "stop" }
        Method {
            name: "seek"
            Parameter { name: "position"; type: "int" }
        }
    }
    Component {
        name: "QDeclarativeCamera"
        prototype: "QObject"
        exports: ["QtMultimedia/Camera 5.0"]
        exportMetaObjectRevisions: [0]
        Enum {
            name: "CaptureMode"
            values: {
                "CaptureViewfinder": 0,
                "CaptureStillImage": 1,
                "CaptureVideo": 2
            }
        }
        Enum {
            name: "State"
            values: {
                "ActiveState": 2,
                "LoadedState": 1,
                "UnloadedState": 0
            }
        }
        Enum {
            name: "Status"
            values: {
                "UnavailableStatus": 0,
                "UnloadedStatus": 1,
                "LoadingStatus": 2,
                "UnloadingStatus": 3,
                "LoadedStatus": 4,
                "StandbyStatus": 5,
                "StartingStatus": 6,
                "StoppingStatus": 7,
                "ActiveStatus": 8
            }
        }
        Enum {
            name: "LockStatus"
            values: {
                "Unlocked": 0,
                "Searching": 1,
                "Locked": 2
            }
        }
        Enum {
            name: "Error"
            values: {
                "NoError": 0,
                "CameraError": 1,
                "InvalidRequestError": 2,
                "ServiceMissingError": 3,
                "NotSupportedFeatureError": 4
            }
        }
        Enum {
            name: "FlashMode"
            values: {
                "FlashAuto": 1,
                "FlashOff": 2,
                "FlashOn": 4,
                "FlashRedEyeReduction": 8,
                "FlashFill": 16,
                "FlashTorch": 32,
                "FlashVideoLight": 64,
                "FlashSlowSyncFrontCurtain": 128,
                "FlashSlowSyncRearCurtain": 256,
                "FlashManual": 512
            }
        }
        Enum {
            name: "ExposureMode"
            values: {
                "ExposureAuto": 0,
                "ExposureManual": 1,
                "ExposurePortrait": 2,
                "ExposureNight": 3,
                "ExposureBacklight": 4,
                "ExposureSpotlight": 5,
                "ExposureSports": 6,
                "ExposureSnow": 7,
                "ExposureBeach": 8,
                "ExposureLargeAperture": 9,
                "ExposureSmallAperture": 10,
                "ExposureModeVendor": 1000
            }
        }
        Enum {
            name: "MeteringMode"
            values: {
                "MeteringMatrix": 1,
                "MeteringAverage": 2,
                "MeteringSpot": 3
            }
        }
        Enum {
            name: "FocusMode"
            values: {
                "FocusManual": 1,
                "FocusHyperfocal": 2,
                "FocusInfinity": 4,
                "FocusAuto": 8,
                "FocusContinuous": 16,
                "FocusMacro": 32
            }
        }
        Enum {
            name: "FocusPointMode"
            values: {
                "FocusPointAuto": 0,
                "FocusPointCenter": 1,
                "FocusPointFaceDetection": 2,
                "FocusPointCustom": 3
            }
        }
        Enum {
            name: "FocusAreaStatus"
            values: {
                "FocusAreaUnused": 1,
                "FocusAreaSelected": 2,
                "FocusAreaFocused": 3
            }
        }
        Enum {
            name: "Availability"
            values: {
                "Available": 0,
                "Busy": 2,
                "Unavailable": 1,
                "ResourceMissing": 3
            }
        }
        Property { name: "captureMode"; type: "CaptureMode" }
        Property { name: "cameraState"; type: "State" }
        Property { name: "cameraStatus"; type: "Status"; isReadonly: true }
        Property { name: "lockStatus"; type: "LockStatus"; isReadonly: true }
        Property { name: "errorCode"; type: "Error"; isReadonly: true }
        Property { name: "errorString"; type: "string"; isReadonly: true }
        Property { name: "availability"; type: "Availability"; isReadonly: true }
        Property { name: "opticalZoom"; type: "double" }
        Property { name: "maximumOpticalZoom"; type: "double"; isReadonly: true }
        Property { name: "digitalZoom"; type: "double" }
        Property { name: "maximumDigitalZoom"; type: "double"; isReadonly: true }
        Property { name: "mediaObject"; type: "QObject"; isReadonly: true; isPointer: true }
        Property {
            name: "imageCapture"
            type: "QDeclarativeCameraCapture"
            isReadonly: true
            isPointer: true
        }
        Property {
            name: "videoRecorder"
            type: "QDeclarativeCameraRecorder"
            isReadonly: true
            isPointer: true
        }
        Property {
            name: "exposure"
            type: "QDeclarativeCameraExposure"
            isReadonly: true
            isPointer: true
        }
        Property { name: "flash"; type: "QDeclarativeCameraFlash"; isReadonly: true; isPointer: true }
        Property { name: "focus"; type: "QDeclarativeCameraFocus"; isReadonly: true; isPointer: true }
        Property {
            name: "imageProcessing"
            type: "QDeclarativeCameraImageProcessing"
            isReadonly: true
            isPointer: true
        }
        Signal { name: "errorChanged" }
        Signal {
            name: "error"
            Parameter { name: "errorCode"; type: "QDeclarativeCamera::Error" }
            Parameter { name: "errorString"; type: "string" }
        }
        Signal {
            name: "cameraStateChanged"
            Parameter { type: "QDeclarativeCamera::State" }
        }
        Signal {
            name: "opticalZoomChanged"
            Parameter { type: "double" }
        }
        Signal {
            name: "digitalZoomChanged"
            Parameter { type: "double" }
        }
        Signal {
            name: "maximumOpticalZoomChanged"
            Parameter { type: "double" }
        }
        Signal {
            name: "maximumDigitalZoomChanged"
            Parameter { type: "double" }
        }
        Signal {
            name: "availabilityChanged"
            Parameter { name: "availability"; type: "Availability" }
        }
        Method {
            name: "setCaptureMode"
            Parameter { name: "mode"; type: "CaptureMode" }
        }
        Method { name: "start" }
        Method { name: "stop" }
        Method {
            name: "setCameraState"
            Parameter { name: "state"; type: "State" }
        }
        Method { name: "searchAndLock" }
        Method { name: "unlock" }
        Method {
            name: "setOpticalZoom"
            Parameter { type: "double" }
        }
        Method {
            name: "setDigitalZoom"
            Parameter { type: "double" }
        }
    }
    Component {
        name: "QDeclarativeCameraCapture"
        prototype: "QObject"
        exports: ["QtMultimedia/CameraCapture 5.0"]
        exportMetaObjectRevisions: [0]
        Property { name: "ready"; type: "bool"; isReadonly: true }
        Property { name: "capturedImagePath"; type: "string"; isReadonly: true }
        Property { name: "resolution"; type: "QSize" }
        Property { name: "errorString"; type: "string"; isReadonly: true }
        Signal {
            name: "readyForCaptureChanged"
            Parameter { type: "bool" }
        }
        Signal {
            name: "imageExposed"
            Parameter { name: "requestId"; type: "int" }
        }
        Signal {
            name: "imageCaptured"
            Parameter { name: "requestId"; type: "int" }
            Parameter { name: "preview"; type: "string" }
        }
        Signal {
            name: "imageMetadataAvailable"
            Parameter { name: "requestId"; type: "int" }
            Parameter { name: "key"; type: "string" }
            Parameter { name: "value"; type: "QVariant" }
        }
        Signal {
            name: "imageSaved"
            Parameter { name: "requestId"; type: "int" }
            Parameter { name: "path"; type: "string" }
        }
        Signal {
            name: "captureFailed"
            Parameter { name: "requestId"; type: "int" }
            Parameter { name: "message"; type: "string" }
        }
        Signal {
            name: "resolutionChanged"
            Parameter { type: "QSize" }
        }
        Method { name: "capture"; type: "int" }
        Method {
            name: "captureToLocation"
            type: "int"
            Parameter { name: "location"; type: "string" }
        }
        Method { name: "cancelCapture" }
        Method {
            name: "setResolution"
            Parameter { name: "resolution"; type: "QSize" }
        }
        Method {
            name: "setMetadata"
            Parameter { name: "key"; type: "string" }
            Parameter { name: "value"; type: "QVariant" }
        }
    }
    Component {
        name: "QDeclarativeCameraExposure"
        prototype: "QObject"
        exports: ["QtMultimedia/CameraExposure 5.0"]
        exportMetaObjectRevisions: [0]
        Property { name: "exposureCompensation"; type: "double" }
        Property { name: "iso"; type: "int"; isReadonly: true }
        Property { name: "shutterSpeed"; type: "double"; isReadonly: true }
        Property { name: "aperture"; type: "double"; isReadonly: true }
        Property { name: "manualShutterSpeed"; type: "double" }
        Property { name: "manualAperture"; type: "double" }
        Property { name: "manualIso"; type: "double" }
        Property { name: "exposureMode"; type: "QDeclarativeCamera::ExposureMode" }
        Property { name: "spotMeteringPoint"; type: "QPointF" }
        Property { name: "meteringMode"; type: "QDeclarativeCamera::MeteringMode" }
        Signal {
            name: "isoSensitivityChanged"
            Parameter { type: "int" }
        }
        Signal {
            name: "apertureChanged"
            Parameter { type: "double" }
        }
        Signal {
            name: "shutterSpeedChanged"
            Parameter { type: "double" }
        }
        Signal {
            name: "manualIsoSensitivityChanged"
            Parameter { type: "int" }
        }
        Signal {
            name: "manualApertureChanged"
            Parameter { type: "double" }
        }
        Signal {
            name: "manualShutterSpeedChanged"
            Parameter { type: "double" }
        }
        Signal {
            name: "exposureCompensationChanged"
            Parameter { type: "double" }
        }
        Signal {
            name: "exposureModeChanged"
            Parameter { type: "QDeclarativeCamera::ExposureMode" }
        }
        Signal {
            name: "meteringModeChanged"
            Parameter { type: "QDeclarativeCamera::MeteringMode" }
        }
        Signal {
            name: "spotMeteringPointChanged"
            Parameter { type: "QPointF" }
        }
        Method {
            name: "setExposureMode"
            Parameter { type: "QDeclarativeCamera::ExposureMode" }
        }
        Method {
            name: "setExposureCompensation"
            Parameter { name: "ev"; type: "double" }
        }
        Method {
            name: "setManualAperture"
            Parameter { type: "double" }
        }
        Method {
            name: "setManualShutterSpeed"
            Parameter { type: "double" }
        }
        Method {
            name: "setManualIsoSensitivity"
            Parameter { name: "iso"; type: "int" }
        }
        Method { name: "setAutoAperture" }
        Method { name: "setAutoShutterSpeed" }
        Method { name: "setAutoIsoSensitivity" }
    }
    Component {
        name: "QDeclarativeCameraFlash"
        prototype: "QObject"
        exports: ["QtMultimedia/CameraFlash 5.0"]
        exportMetaObjectRevisions: [0]
        Property { name: "ready"; type: "bool"; isReadonly: true }
        Property { name: "mode"; type: "int" }
        Signal {
            name: "flashReady"
            Parameter { name: "status"; type: "bool" }
        }
        Signal {
            name: "flashModeChanged"
            Parameter { type: "int" }
        }
        Method {
            name: "setFlashMode"
            Parameter { type: "int" }
        }
    }
    Component {
        name: "QDeclarativeCameraFocus"
        prototype: "QObject"
        exports: ["QtMultimedia/CameraFocus 5.0"]
        exportMetaObjectRevisions: [0]
        Property { name: "focusMode"; type: "QDeclarativeCamera::FocusMode" }
        Property { name: "focusPointMode"; type: "QDeclarativeCamera::FocusPointMode" }
        Property { name: "customFocusPoint"; type: "QPointF" }
        Property { name: "focusZones"; type: "QObject"; isReadonly: true; isPointer: true }
        Signal {
            name: "focusModeChanged"
            Parameter { type: "QDeclarativeCamera::FocusMode" }
        }
        Signal {
            name: "focusPointModeChanged"
            Parameter { type: "QDeclarativeCamera::FocusPointMode" }
        }
        Signal {
            name: "customFocusPointChanged"
            Parameter { type: "QPointF" }
        }
        Method {
            name: "setFocusMode"
            Parameter { type: "QDeclarativeCamera::FocusMode" }
        }
        Method {
            name: "setFocusPointMode"
            Parameter { name: "mode"; type: "QDeclarativeCamera::FocusPointMode" }
        }
        Method {
            name: "setCustomFocusPoint"
            Parameter { name: "point"; type: "QPointF" }
        }
        Method {
            name: "isFocusModeSupported"
            type: "bool"
            Parameter { name: "mode"; type: "QDeclarativeCamera::FocusMode" }
        }
        Method {
            name: "isFocusPointModeSupported"
            type: "bool"
            Parameter { name: "mode"; type: "QDeclarativeCamera::FocusPointMode" }
        }
    }
    Component {
        name: "QDeclarativeCameraImageProcessing"
        prototype: "QObject"
        exports: ["QtMultimedia/CameraImageProcessing 5.0"]
        exportMetaObjectRevisions: [0]
        Enum {
            name: "WhiteBalanceMode"
            values: {
                "WhiteBalanceAuto": 0,
                "WhiteBalanceManual": 1,
                "WhiteBalanceSunlight": 2,
                "WhiteBalanceCloudy": 3,
                "WhiteBalanceShade": 4,
                "WhiteBalanceTungsten": 5,
                "WhiteBalanceFluorescent": 6,
                "WhiteBalanceFlash": 7,
                "WhiteBalanceSunset": 8,
                "WhiteBalanceVendor": 1000
            }
        }
        Property { name: "whiteBalanceMode"; type: "WhiteBalanceMode" }
        Property { name: "manualWhiteBalance"; type: "double" }
        Property { name: "contrast"; type: "double" }
        Property { name: "saturation"; type: "double" }
        Property { name: "sharpeningLevel"; type: "double" }
        Property { name: "denoisingLevel"; type: "double" }
        Signal {
            name: "whiteBalanceModeChanged"
            Parameter { type: "QDeclarativeCameraImageProcessing::WhiteBalanceMode" }
        }
        Signal {
            name: "manualWhiteBalanceChanged"
            Parameter { type: "double" }
        }
        Signal {
            name: "contrastChanged"
            Parameter { type: "double" }
        }
        Signal {
            name: "saturationChanged"
            Parameter { type: "double" }
        }
        Signal {
            name: "sharpeningLevelChanged"
            Parameter { type: "double" }
        }
        Signal {
            name: "denoisingLevelChanged"
            Parameter { type: "double" }
        }
        Method {
            name: "setWhiteBalanceMode"
            Parameter { name: "mode"; type: "QDeclarativeCameraImageProcessing::WhiteBalanceMode" }
        }
        Method {
            name: "setManualWhiteBalance"
            Parameter { name: "colorTemp"; type: "double" }
        }
        Method {
            name: "setContrast"
            Parameter { name: "value"; type: "double" }
        }
        Method {
            name: "setSaturation"
            Parameter { name: "value"; type: "double" }
        }
        Method {
            name: "setSharpeningLevel"
            Parameter { name: "value"; type: "double" }
        }
        Method {
            name: "setDenoisingLevel"
            Parameter { name: "value"; type: "double" }
        }
    }
    Component {
        name: "QDeclarativeCameraRecorder"
        prototype: "QObject"
        exports: ["QtMultimedia/CameraRecorder 5.0"]
        exportMetaObjectRevisions: [0]
        Enum {
            name: "RecorderState"
            values: {
                "StoppedState": 0,
                "RecordingState": 1
            }
        }
        Enum {
            name: "RecorderStatus"
            values: {
                "UnavailableStatus": 0,
                "UnloadedStatus": 1,
                "LoadingStatus": 2,
                "LoadedStatus": 3,
                "StartingStatus": 4,
                "RecordingStatus": 5,
                "PausedStatus": 6,
                "FinalizingStatus": 7
            }
        }
        Enum {
            name: "EncodingMode"
            values: {
                "ConstantQualityEncoding": 0,
                "ConstantBitRateEncoding": 1,
                "AverageBitRateEncoding": 2
            }
        }
        Enum {
            name: "Error"
            values: {
                "NoError": 0,
                "ResourceError": 1,
                "FormatError": 2,
                "OutOfSpaceError": 3
            }
        }
        Property { name: "recorderState"; type: "RecorderState" }
        Property { name: "recorderStatus"; type: "RecorderStatus"; isReadonly: true }
        Property { name: "videoCodec"; type: "string" }
        Property { name: "resolution"; type: "QSize" }
        Property { name: "frameRate"; type: "double" }
        Property { name: "videoBitRate"; type: "int" }
        Property { name: "videoEncodingMode"; type: "EncodingMode" }
        Property { name: "audioCodec"; type: "string" }
        Property { name: "audioBitRate"; type: "int" }
        Property { name: "audioChannels"; type: "int" }
        Property { name: "audioSampleRate"; type: "int" }
        Property { name: "audioEncodingMode"; type: "EncodingMode" }
        Property { name: "mediaContainer"; type: "string" }
        Property { name: "duration"; type: "qlonglong"; isReadonly: true }
        Property { name: "outputLocation"; type: "string" }
        Property { name: "actualLocation"; type: "string"; isReadonly: true }
        Property { name: "muted"; type: "bool" }
        Property { name: "errorString"; type: "string"; isReadonly: true }
        Property { name: "errorCode"; type: "string"; isReadonly: true }
        Signal {
            name: "recorderStateChanged"
            Parameter { name: "state"; type: "QDeclarativeCameraRecorder::RecorderState" }
        }
        Signal {
            name: "durationChanged"
            Parameter { name: "duration"; type: "qlonglong" }
        }
        Signal {
            name: "mutedChanged"
            Parameter { name: "muted"; type: "bool" }
        }
        Signal {
            name: "outputLocationChanged"
            Parameter { name: "location"; type: "string" }
        }
        Signal {
            name: "actualLocationChanged"
            Parameter { name: "location"; type: "string" }
        }
        Signal {
            name: "error"
            Parameter { name: "errorCode"; type: "QDeclarativeCameraRecorder::Error" }
            Parameter { name: "errorString"; type: "string" }
        }
        Signal {
            name: "metaDataChanged"
            Parameter { name: "key"; type: "string" }
            Parameter { name: "value"; type: "QVariant" }
        }
        Signal {
            name: "captureResolutionChanged"
            Parameter { type: "QSize" }
        }
        Signal {
            name: "audioCodecChanged"
            Parameter { name: "codec"; type: "string" }
        }
        Signal {
            name: "videoCodecChanged"
            Parameter { name: "codec"; type: "string" }
        }
        Signal {
            name: "mediaContainerChanged"
            Parameter { name: "container"; type: "string" }
        }
        Signal {
            name: "frameRateChanged"
            Parameter { name: "arg"; type: "double" }
        }
        Signal {
            name: "videoBitRateChanged"
            Parameter { name: "arg"; type: "int" }
        }
        Signal {
            name: "audioBitRateChanged"
            Parameter { name: "arg"; type: "int" }
        }
        Signal {
            name: "audioChannelsChanged"
            Parameter { name: "arg"; type: "int" }
        }
        Signal {
            name: "audioSampleRateChanged"
            Parameter { name: "arg"; type: "int" }
        }
        Signal {
            name: "audioEncodingModeChanged"
            Parameter { name: "encodingMode"; type: "EncodingMode" }
        }
        Signal {
            name: "videoEncodingModeChanged"
            Parameter { name: "encodingMode"; type: "EncodingMode" }
        }
        Method {
            name: "setOutputLocation"
            Parameter { name: "location"; type: "string" }
        }
        Method { name: "record" }
        Method { name: "stop" }
        Method {
            name: "setRecorderState"
            Parameter { name: "state"; type: "QDeclarativeCameraRecorder::RecorderState" }
        }
        Method {
            name: "setMuted"
            Parameter { name: "muted"; type: "bool" }
        }
        Method {
            name: "setMetadata"
            Parameter { name: "key"; type: "string" }
            Parameter { name: "value"; type: "QVariant" }
        }
        Method {
            name: "setCaptureResolution"
            Parameter { name: "resolution"; type: "QSize" }
        }
        Method {
            name: "setAudioCodec"
            Parameter { name: "codec"; type: "string" }
        }
        Method {
            name: "setVideoCodec"
            Parameter { name: "codec"; type: "string" }
        }
        Method {
            name: "setMediaContainer"
            Parameter { name: "container"; type: "string" }
        }
        Method {
            name: "setFrameRate"
            Parameter { name: "frameRate"; type: "double" }
        }
        Method {
            name: "setVideoBitRate"
            Parameter { name: "rate"; type: "int" }
        }
        Method {
            name: "setAudioBitRate"
            Parameter { name: "rate"; type: "int" }
        }
        Method {
            name: "setAudioChannels"
            Parameter { name: "channels"; type: "int" }
        }
        Method {
            name: "setAudioSampleRate"
            Parameter { name: "rate"; type: "int" }
        }
        Method {
            name: "setVideoEncodingMode"
            Parameter { name: "encodingMode"; type: "EncodingMode" }
        }
        Method {
            name: "setAudioEncodingMode"
            Parameter { name: "encodingMode"; type: "EncodingMode" }
        }
    }
    Component {
        name: "QDeclarativeRadio"
        prototype: "QObject"
        exports: ["QtMultimedia/Radio 5.0"]
        exportMetaObjectRevisions: [0]
        Enum {
            name: "State"
            values: {
                "ActiveState": 0,
                "StoppedState": 1
            }
        }
        Enum {
            name: "Band"
            values: {
                "AM": 0,
                "FM": 1,
                "SW": 2,
                "LW": 3,
                "FM2": 4
            }
        }
        Enum {
            name: "Error"
            values: {
                "NoError": 0,
                "ResourceError": 1,
                "OpenError": 2,
                "OutOfRangeError": 3
            }
        }
        Enum {
            name: "StereoMode"
            values: {
                "ForceStereo": 0,
                "ForceMono": 1,
                "Auto": 2
            }
        }
        Enum {
            name: "SearchMode"
            values: {
                "SearchFast": 0,
                "SearchGetStationId": 1
            }
        }
        Enum {
            name: "Availability"
            values: {
                "Available": 0,
                "Busy": 2,
                "Unavailable": 1,
                "ResourceMissing": 3
            }
        }
        Property { name: "state"; type: "State"; isReadonly: true }
        Property { name: "band"; type: "Band" }
        Property { name: "frequency"; type: "int" }
        Property { name: "stereo"; type: "bool"; isReadonly: true }
        Property { name: "stereoMode"; type: "StereoMode" }
        Property { name: "signalStrength"; type: "int"; isReadonly: true }
        Property { name: "volume"; type: "int" }
        Property { name: "muted"; type: "bool" }
        Property { name: "searching"; type: "bool"; isReadonly: true }
        Property { name: "frequencyStep"; type: "int"; isReadonly: true }
        Property { name: "minimumFrequency"; type: "int"; isReadonly: true }
        Property { name: "maximumFrequency"; type: "int"; isReadonly: true }
        Property { name: "antennaConnected"; type: "bool"; isReadonly: true }
        Property { name: "availability"; type: "Availability"; isReadonly: true }
        Property { name: "radioData"; type: "QDeclarativeRadioData"; isReadonly: true; isPointer: true }
        Signal {
            name: "stateChanged"
            Parameter { name: "state"; type: "QDeclarativeRadio::State" }
        }
        Signal {
            name: "bandChanged"
            Parameter { name: "band"; type: "QDeclarativeRadio::Band" }
        }
        Signal {
            name: "frequencyChanged"
            Parameter { name: "frequency"; type: "int" }
        }
        Signal {
            name: "stereoStatusChanged"
            Parameter { name: "stereo"; type: "bool" }
        }
        Signal {
            name: "searchingChanged"
            Parameter { name: "searching"; type: "bool" }
        }
        Signal {
            name: "signalStrengthChanged"
            Parameter { name: "signalStrength"; type: "int" }
        }
        Signal {
            name: "volumeChanged"
            Parameter { name: "volume"; type: "int" }
        }
        Signal {
            name: "mutedChanged"
            Parameter { name: "muted"; type: "bool" }
        }
        Signal {
            name: "stationFound"
            Parameter { name: "frequency"; type: "int" }
            Parameter { name: "stationId"; type: "string" }
        }
        Signal {
            name: "antennaConnectedChanged"
            Parameter { name: "connectionStatus"; type: "bool" }
        }
        Signal {
            name: "availabilityChanged"
            Parameter { name: "availability"; type: "Availability" }
        }
        Signal { name: "errorChanged" }
        Signal {
            name: "error"
            Parameter { name: "errorCode"; type: "QDeclarativeRadio::Error" }
        }
        Method {
            name: "setBand"
            Parameter { name: "band"; type: "QDeclarativeRadio::Band" }
        }
        Method {
            name: "setFrequency"
            Parameter { name: "frequency"; type: "int" }
        }
        Method {
            name: "setStereoMode"
            Parameter { name: "stereoMode"; type: "QDeclarativeRadio::StereoMode" }
        }
        Method {
            name: "setVolume"
            Parameter { name: "volume"; type: "int" }
        }
        Method {
            name: "setMuted"
            Parameter { name: "muted"; type: "bool" }
        }
        Method { name: "cancelScan" }
        Method { name: "scanDown" }
        Method { name: "scanUp" }
        Method { name: "tuneUp" }
        Method { name: "tuneDown" }
        Method {
            name: "searchAllStations"
            Parameter { name: "searchMode"; type: "QDeclarativeRadio::SearchMode" }
        }
        Method { name: "searchAllStations" }
        Method { name: "start" }
        Method { name: "stop" }
        Method { name: "isAvailable"; type: "bool" }
    }
    Component {
        name: "QDeclarativeRadioData"
        prototype: "QObject"
        exports: ["QtMultimedia/RadioData 5.0"]
        exportMetaObjectRevisions: [0]
        Enum {
            name: "Error"
            values: {
                "NoError": 0,
                "ResourceError": 1,
                "OpenError": 2,
                "OutOfRangeError": 3
            }
        }
        Enum {
            name: "ProgramType"
            values: {
                "Undefined": 0,
                "News": 1,
                "CurrentAffairs": 2,
                "Information": 3,
                "Sport": 4,
                "Education": 5,
                "Drama": 6,
                "Culture": 7,
                "Science": 8,
                "Varied": 9,
                "PopMusic": 10,
                "RockMusic": 11,
                "EasyListening": 12,
                "LightClassical": 13,
                "SeriousClassical": 14,
                "OtherMusic": 15,
                "Weather": 16,
                "Finance": 17,
                "ChildrensProgrammes": 18,
                "SocialAffairs": 19,
                "Religion": 20,
                "PhoneIn": 21,
                "Travel": 22,
                "Leisure": 23,
                "JazzMusic": 24,
                "CountryMusic": 25,
                "NationalMusic": 26,
                "OldiesMusic": 27,
                "FolkMusic": 28,
                "Documentary": 29,
                "AlarmTest": 30,
                "Alarm": 31,
                "Talk": 32,
                "ClassicRock": 33,
                "AdultHits": 34,
                "SoftRock": 35,
                "Top40": 36,
                "Soft": 37,
                "Nostalgia": 38,
                "Classical": 39,
                "RhythmAndBlues": 40,
                "SoftRhythmAndBlues": 41,
                "Language": 42,
                "ReligiousMusic": 43,
                "ReligiousTalk": 44,
                "Personality": 45,
                "Public": 46,
                "College": 47
            }
        }
        Enum {
            name: "Availability"
            values: {
                "Available": 0,
                "Busy": 2,
                "Unavailable": 1,
                "ResourceMissing": 3
            }
        }
        Property { name: "stationId"; type: "string"; isReadonly: true }
        Property { name: "programType"; type: "QDeclarativeRadioData::ProgramType"; isReadonly: true }
        Property { name: "programTypeName"; type: "string"; isReadonly: true }
        Property { name: "stationName"; type: "string"; isReadonly: true }
        Property { name: "radioText"; type: "string"; isReadonly: true }
        Property { name: "alternativeFrequenciesEnabled"; type: "bool" }
        Property { name: "availability"; type: "Availability"; isReadonly: true }
        Signal {
            name: "stationIdChanged"
            Parameter { name: "stationId"; type: "string" }
        }
        Signal {
            name: "programTypeChanged"
            Parameter { name: "programType"; type: "QDeclarativeRadioData::ProgramType" }
        }
        Signal {
            name: "programTypeNameChanged"
            Parameter { name: "programTypeName"; type: "string" }
        }
        Signal {
            name: "stationNameChanged"
            Parameter { name: "stationName"; type: "string" }
        }
        Signal {
            name: "radioTextChanged"
            Parameter { name: "radioText"; type: "string" }
        }
        Signal {
            name: "alternativeFrequenciesEnabledChanged"
            Parameter { name: "enabled"; type: "bool" }
        }
        Signal {
            name: "availabilityChanged"
            Parameter { name: "availability"; type: "Availability" }
        }
        Signal { name: "errorChanged" }
        Signal {
            name: "error"
            Parameter { name: "errorCode"; type: "QDeclarativeRadioData::Error" }
        }
        Method {
            name: "setAlternativeFrequenciesEnabled"
            Parameter { name: "enabled"; type: "bool" }
        }
        Method { name: "isAvailable"; type: "bool" }
    }
    Component {
        name: "QDeclarativeTorch"
        prototype: "QObject"
        exports: ["QtMultimedia/Torch 5.0"]
        exportMetaObjectRevisions: [0]
        Property { name: "enabled"; type: "bool" }
        Property { name: "power"; type: "int" }
    }
    Component {
        name: "QDeclarativeVideoOutput"
        defaultProperty: "data"
        prototype: "QQuickItem"
        exports: ["QtMultimedia/VideoOutput 5.0"]
        exportMetaObjectRevisions: [0]
        Enum {
            name: "FillMode"
            values: {
                "Stretch": 0,
                "PreserveAspectFit": 1,
                "PreserveAspectCrop": 2
            }
        }
        Property { name: "source"; type: "QObject"; isPointer: true }
        Property { name: "fillMode"; type: "FillMode" }
        Property { name: "orientation"; type: "int" }
        Property { name: "sourceRect"; type: "QRectF"; isReadonly: true }
        Property { name: "contentRect"; type: "QRectF"; isReadonly: true }
        Signal {
            name: "fillModeChanged"
            Parameter { type: "QDeclarativeVideoOutput::FillMode" }
        }
        Method {
            name: "mapPointToItem"
            type: "QPointF"
            Parameter { name: "point"; type: "QPointF" }
        }
        Method {
            name: "mapRectToItem"
            type: "QRectF"
            Parameter { name: "rectangle"; type: "QRectF" }
        }
        Method {
            name: "mapNormalizedPointToItem"
            type: "QPointF"
            Parameter { name: "point"; type: "QPointF" }
        }
        Method {
            name: "mapNormalizedRectToItem"
            type: "QRectF"
            Parameter { name: "rectangle"; type: "QRectF" }
        }
        Method {
            name: "mapPointToSource"
            type: "QPointF"
            Parameter { name: "point"; type: "QPointF" }
        }
        Method {
            name: "mapRectToSource"
            type: "QRectF"
            Parameter { name: "rectangle"; type: "QRectF" }
        }
        Method {
            name: "mapPointToSourceNormalized"
            type: "QPointF"
            Parameter { name: "point"; type: "QPointF" }
        }
        Method {
            name: "mapRectToSourceNormalized"
            type: "QRectF"
            Parameter { name: "rectangle"; type: "QRectF" }
        }
    }
    Component {
        name: "QMediaObject"
        prototype: "QObject"
        Property { name: "notifyInterval"; type: "int" }
        Signal {
            name: "notifyIntervalChanged"
            Parameter { name: "milliSeconds"; type: "int" }
        }
        Signal {
            name: "metaDataAvailableChanged"
            Parameter { name: "available"; type: "bool" }
        }
        Signal { name: "metaDataChanged" }
        Signal {
            name: "metaDataChanged"
            Parameter { name: "key"; type: "string" }
            Parameter { name: "value"; type: "QVariant" }
        }
        Signal {
            name: "availabilityChanged"
            Parameter { name: "available"; type: "bool" }
        }
        Signal {
            name: "availabilityChanged"
            Parameter { name: "availability"; type: "QMultimedia::AvailabilityStatus" }
        }
    }
    Component {
        name: "QSoundEffect"
        prototype: "QObject"
        exports: ["QtMultimedia/SoundEffect 5.0"]
        exportMetaObjectRevisions: [0]
        Enum {
            name: "Loop"
            values: {
                "Infinite": -2
            }
        }
        Enum {
            name: "Status"
            values: {
                "Null": 0,
                "Loading": 1,
                "Ready": 2,
                "Error": 3
            }
        }
        Property { name: "source"; type: "QUrl" }
        Property { name: "loops"; type: "int" }
        Property { name: "loopsRemaining"; type: "int"; isReadonly: true }
        Property { name: "volume"; type: "double" }
        Property { name: "muted"; type: "bool" }
        Property { name: "playing"; type: "bool"; isReadonly: true }
        Property { name: "status"; type: "Status"; isReadonly: true }
        Property { name: "category"; type: "string" }
        Signal { name: "loopCountChanged" }
        Signal { name: "loadedChanged" }
        Method { name: "play" }
        Method { name: "stop" }
    }
}
