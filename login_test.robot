*** Settings ***
Library           AppiumLibrary
Library           Collections
Library           OperatingSystem

*** Variables ***
${REMOTE_URL}           http://127.0.0.1:4723/wd/hub
${APP}                  /Users/anhtruong/Downloads/app-31.apk
${PLATFORM}             Android
${DEVICE_NAME}          R9HR201CADJ
${AUTOMATION_NAME}      UiAutomator2
${PACKAGE_NAME}         com.monystudio.detectorhiddendevices
${NEW_COMMAND_TIMEOUT}  2500

*** Keywords ***
Setup Android Test
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM}
    ...    deviceName=${DEVICE_NAME}
    ...    automationName=${AUTOMATION_NAME}
    ...    app=${APP}
    ...    newCommandTimeout=${NEW_COMMAND_TIMEOUT}
    ...    noReset=true
    ...    skipDeviceInitialization=true
    ...    skipServerInstallation=true
    Wait Until Page Contains Element    xpath=//android.widget.TextView    timeout=20
    Log    App launched successfully
    Capture Page Screenshot

*** Test Cases ***
Check App Launch Successfully
    Setup Android Test
    Element Should Be Visible    xpath=//android.widget.TextView
    Close Application

Check Crash When Opening Features
    Setup Android Test
    Run Keyword And Continue On Failure    Click Element    xpath=//android.widget.TextView[@text="Magnetic Detection"]
    Run Keyword And Continue On Failure    Click Element    xpath=//android.widget.TextView[@text="Camera IR Detection"]
    Run Keyword And Continue On Failure    Click Element    xpath=//android.widget.TextView[@text="WiFi Detection"]
    Run Keyword And Continue On Failure    Click Element    xpath=//android.widget.TextView[@text="Bluetooth Detection"]
    Capture Page Screenshot
    Close Application

Check Crash When Opening Deep Scan
    Setup Android Test
    Click Element    xpath=//android.widget.TextView[@text="All Device Detector"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Deep Scan"]
    Click Element    xpath=//android.widget.TextView[@text="Deep Scan"]
    Sleep    5s
    Capture Page Screenshot
    Close Application
 