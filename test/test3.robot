*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Test Setup    Open Browser and Check
Test Teardown    Close Browser Session
Resource     resource.robot
*** Variables ***

*** Test Cases ***
Validate Child Window Functionality
    Select the link of Child Window
    Verify the user is Switched to Child Window
    Grab the Email id in the Child Window
#    Switch to Parent window and enter the Email


*** Keywords ***
Select the link of Child Window
    click element    Xpath://a[@class='blinkingText']
Verify the user is Switched to Child Window
    Switch Window    New
    Sleep    5
    dshchdhjckjjfdtwdtfgzxbb    nsjskjcs    0000

Grab the Email id in the Child Window
    ${text}=    get text    Xpath://p[@class='im-para red']
    @{words}=    Split String    ${text}    at
    #0 ->Please email u 
    #1 -> mentor@rahulshettyacademy.com with below template to recieve response
    ${text_split}=    Get From List    ${words}    1
    Log To Console       ${text_split}