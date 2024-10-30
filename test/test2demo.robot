*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${Error_Message_Login}    css:.alert-danger
*** Test Cases ***
Validation
    Open Browser and Check
    Fill the Login Form
    Wait Until It check and display error message
    Verify Error Message

*** Keywords ***
Open Browser and Check
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/
Fill the Login Form

    Input Text    id:username    rahulshettyacademy
    Input Password    id:password    12345678
    Click Button    signInBtn
Wait Until It check and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}
Verify Error Message

    ${result}=    Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.

        