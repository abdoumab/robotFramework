*** Settings ***
Suite Setup  SuiteSetup
Suite Teardown  Close Browser
Test Setup    Go To    ${Url}
Library  SeleniumLibrary
Library    DateTime
Library    Screenshot
Test Template  Login With Invalid Credentials
Resource        ..\resources\resource.robot
*** Test Cases ***                           USER NAME             PASSWORD
Login With Invalid Credentials              ${invalidUsername}      ${password}
Login With Invalid Credentials              ${username}             ${invalidPassword}
Login With Invalid Credentials              ${invalidUsername}             ${invalidPassword}
*** Keywords ***
SuiteSetup
  Open Browser  ${Url}  ${Browser}

Login With Invalid Credentials
    [Arguments]    ${username}    ${password}
    Sleep    3s
    Input Text    username    ${username}
    Input Text    password    ${password}
    Click Element  xpath://button[@type="submit"]
    Sleep    2s
    Page Should Contain   Invalid credentials 
    Take Screenshot
Valid GIP
  Click Link  xpath://a[text()='GIP']
  Sleep    2s
  Take Screenshot