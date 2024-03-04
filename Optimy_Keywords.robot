*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Library    Collections
Library    OperatingSystem
Resource   Optimy_PageObjects.robot

*** Variables ***
${browser}          Chrome
${email}            optimyautomationtester@gmail.com
${password}         2MsWseoj
${filePath}         C:\\Users\\eliza\\OneDrive\\Desktop\\Automation Assessment\\JaneDoe.jpg
${firstNameValue}        Jane
${lastNameValue}         Doe
${addressValue}          123 Test St, Quezon City
${postCodeValue}         1000
${countryValue}          Philippines
${genderValue}           Female
${roleValue}             Automation tester
${careerObjValue}        World domination
@{labels}    Spreadsheet    JIRA    Test management tool (any)    SQL, MySQL, MySQLi    Javascript    Python    Robot Framework    Cypress

*** Keywords ***
User goes to the application website
    Open Browser    ${URL}    ${browser}
    Maximize Browser Window
    Click Button    ${closeBtn}
    Click Element    ${loginBtn}
     
User logs in with credentials         
    Input Text      css:input[name='email']    ${email}
    Input Password  css:input[name='password']    ${password}
    Click Button    css:button[type='submit']
    
User submits a new application
    Click Element   ${submitApp}
    Click Element   ${submitBtn}
   
User fills out the forms
    Input First Name    ${firstNameValue}
    Input Last Name    ${lastNameValue}
    Input Address    ${addressValue}
    Input Postal Code    ${postCodeValue}
    Select Country    ${countryValue}
    Choose File    ${browseFile}    ${filePath}
    Choose Gender
    Select Role    ${roleValue}
    Select Tools
    Input Career Objective    ${careerObjValue}
    
User clicks Next screen button
    Click Button    ${nextScreenBtn}

User verifies all inputted values in the Summary screen
    Verify Personal Details
    Click Button    ${${validateSendBtn}

User verifies redirection to Thank you page
    Wait Until Page Contains Element    ${thankYouMessage}      timeout=15s
    ${heading_text} =    Get Text    css:h1.h1.text-center
    Should Contain    ${heading_text}    Thank you for submitting your project

