*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary
*** Variables ***
${Base URL}    https://reqres.in
${FirstUser}
*** Test Cases ***
# TC 001 get Request
#     Create Session    GetUser    ${Base URL}    verify=true
#     ${Response}=    GET On Session     GetUser    url=/api/users?page=2
#     Log To Console    ${Response.status_code}
#     Log To Console    ${Response.content}

TC 002 get Request
      Create Session    GetUser    ${Base URL}    verify=true
      &{Params}=         BuiltIn.Create Dictionary     page=2
      ${Response}=       Get On Session     GetUser     /api/users     ${Params}     expected_status=200
      ${JsonResponse}=   Set Variable     ${Response.json()}
      ${UsersList}=      Get Value From Json     ${JsonResponse}     data[:]
      ${FirstUser}=      Get From List     ${UsersList}     0
      Should Be Equal     ${FirstUser['first_name']}      Michael



*** Keywords ***