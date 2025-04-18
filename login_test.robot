*** Settings ***
Library           AppiumLibrary

*** Variables ***
${REMOTE_URL}       http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}    Android
${PLATFORM_VERSION} 11
${DEVICE_NAME}      BGB00005932
${APP_PACKAGE}      com.qrcodescanner.android
${APP_ACTIVITY}     com.qrcodescanner.android.MainActivity

*** Test Cases ***
Test QR Code Scanner App
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    Wait Unitl Page Contains QR code Scanner timeout=20s
    Capture Page Screenshot
    Close Application

 
    # Kiểm tra ứng dụng có mở thành công không
    Run Keyword And Continue On Failure    Wait Until Page Contains Element    //*[@text="Scan QR Code"]    timeout=5s

    # Thử bấm nút quét mã QR automation té 
    Click Element    //*[@text="Scan QR Code"]
    Sleep    3s

    # Kiểm tra xem có bị crash không
    Run Keyword And Continue On Failure    Page Should Contain Element    //*[@text="Scanning..."]

    Close Application
 