ecm_add_test(
    test_cppcheckparser.cpp

    TEST_NAME test_cppcheckparser
    LINK_LIBRARIES kdevcppcheck_core Qt5::Test KDev::Tests
)

ecm_add_test(
    test_cppcheckjob.cpp

    TEST_NAME test_cppcheckjob
    LINK_LIBRARIES kdevcppcheck_core Qt5::Test KDev::Tests
)
