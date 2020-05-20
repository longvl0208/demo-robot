*** Setting ***
Library    SeleniumLibrary

Suite Setup    Log    I am inside Test Suite Setup 
Suite Teardown    Log    I am inside Test Suite Teardown
Test Setup    Log    I am inside Test Setup
Test Teardown    Log    I am inside Test Teardown    

Default Tags    sanity

*** Test Cases ***
# MyFirstTest
    # [Tags]    smoke
    # Log    Hello World...    
    
# MySecondTest
    # [Tags]    example
    # Log    I am inside second test 
    # Set Tags    regresion1
    # Remove Tags    regresion1
    
# MyThirdTest
    # Log   i am inside third test  
    
FirstSeleniumTest
    Open Browser    https://google.com    chrome
    Set Browser Implicit Wait    5
    Input Text    name=q    Automation step by step
    Press Keys    name=q    ENTER
    # Click Button  name=btnK
    Sleep    2    
    Close Browser
    Log    Test Completed

SampleLoginTest
    [Documentation]    This is a sample login test
    Open Browser       ${URL}    chrome
    Set Browser Implicit Wait    5
    LoginKW
    Sleep    2
    Click Element      id=welcome
    Click Element      link=Logout
    # Close Browser
    Log                Test competed
    Log                This test was executed by %{username} on %{os}
    
*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKW
        Input Text         id=txtUsername    ${CREDENTIALS}[0] 
        Input Password     id=txtPassword    ${LOGINDATA}[password]
        Click Button       id=btnLogin
          