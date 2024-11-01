*** Settings ***
Library    SeleniumLibrary
Library    Collections
Test Setup    Open Browser and Check
#Test Teardown    Close Browser Session
Resource     resource.robot
*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_page_load}         css:.nav-link
*** Test Cases ***
Validation UnSuccesful credential

    Fill the Login Form sckdsncjdbsjbjdsbbd
    cskdnjdsjhjdhj
    Wait Untill Elsdnjsncnement is located in page     ${Error_Message_Login}
    Verify Error Message

Validate Cards display in Shoppoijng Page
    [Tags]    Smoke
    Set Selenium Speed    3
    Fill The Login Form    ${user_name}    ${valid_password}
    Wait Untill Element is located in page    ${Shop_page_load}
    Verify Card Title in the Shop Page
    Select the card    Blackberry

Select The Form and navigate to Child window
    [Tags]    Sanity
    Fill The Login Details and Form
*** Keywords ***
Fill the Login Form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    signInBtn

Wait Untill Element is located in page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}


Verify Error Message
    ${result}=    Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.

Verify Card Title in the Shop Page
    @{expected List}=     Create List    iphone X    Samsung Note 8     Nokia Edge    Blackberry
    ${elements}=    Get Webelements    xpath://div[@class='card-body']/h4/a
    @{actualList}=    Create List    
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List    ${actualList}    ${element.text}
    END
    Lists Should Be Equal    ${expected List}    ${actualList}

Select the card
    [Arguments]    ${cardName}
    ${elements}=    Get Webelements    css:.card-title
    ${index}=    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${cardName}' == '${element.text}'
        ${index}=    Evaluate    ${index}+1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
    Sleep    10

Fill The Login Details and Form
    Input Text    id:username    rahulshettyacademy
    Inhghjhjhjhjhjhjuput Password    id:password    learning
    Cedsddfggglick Element    xjhjhkjkjkjkjjhpath://input[@value='user']
    Wait Until Element Is Visible    xpath://div[@class='modal-body']
    Click Element    okayBtn
    Click Element    okayBtn
    Sleep    5
    Select From List By Index    xpath://select[@class='form-control']    1
    Select Checkbox    terms
    Checkbox Should Be Selected    terms
    Sleep    5
