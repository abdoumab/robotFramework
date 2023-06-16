*** Settings ***
Suite Setup  SuiteSetup
Suite Teardown  Close Browser
Library  SeleniumLibrary
Library    DateTime
Library    Screenshot
*** Variables ***
${Browser}  Chrome
${Url}  http://orangehrm.progideo.com/
${username}  adminabb
${password}  Adminabb2023;
*** Test Cases ***
TC 001 S'authentifier
  Log  Ouverture ${Browser}
  Sleep  3s
  Valid Login
  Valid GIP
*** Keywords ***
SuiteSetup
  Open Browser  ${Url}  ${Browser}

Valid Login
  Page Should Contain Element    username
  Input Text    username    ${username}
  Input Text    password    ${password}
  Click Element  xpath://button[@type="submit"]
  Wait Until Page Contains   Tableau de bord
  Take Screenshot

Valid GIP
  Click Link  xpath://a[text()='GIP']
  Sleep    2s
  Take Screenshot