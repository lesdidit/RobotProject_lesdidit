*** Settings ***
Library      SeleniumLibrary    

Suite Setup    Log    Inside Test Suite Setup
Suite Teardown    Log    Inside Test Suite Teardown
Test Setup    Log    Inside Test Setup    
Test Teardown    Log    Inside Test Teardown

Default Tags    sanity

*** Test Cases ***
MyFirstTest
    Log    Hello World...    
    
FirstSeleniumTest
    Close Browser    
    Open Browser    https://google.com    chrome
    Sleep    5
    Input Text    name=q    Priority Property Investments Ltd
    Press Keys    name=q    ENTER
    Sleep    5    
    Close Browser
    
SampleLoginTest
    [Documentation]   This is a sample login test
    Open Browser      https://opensource-demo.orangehrmlive.com/     chrome
    Set Browser Implicit Wait    5

#USER KEYWORDS Test
    LoginMatey
    
    Click Element     id=welcome
    Click Element     link=Logout
    Close Browser    
    Log               Test Done        
    
#ENIRONMENT Variable test
    Log    This test was executed by %{username} on %{os}    
    
#BUILT-IN Variable Test
    Log    %{username} Current Directory is ${CURDIR}    
    
MyTagTest
    Log    Default Tag
    
MyTagTest1
    [Tags]    smoke
    Log    Local Test Tag
    
MyTagTest2
    Log    Add Tag
    Set Tags    regression1
    
MyTagTest4
    [Tags]    smoke
    Log    Local Test Tag Removed
    Remove Tags    smoke
    
*** Variables ***
#SCALAR
${URL}    https://opensource-demo.orangehrmlive.com/

#LIST
@{CREDENTIALS}    Admin    admin123

#DICTIONARY
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginMatey
#SCALAR Variable Test
    Input Text        id=txtUsername    @{CREDENTIALS}[0]
    
#DICTIONARY Variable Test
    Input Password    id=txtPassword    &{LOGINDATA}[password]
    Click Button      id=btnLogin
    
