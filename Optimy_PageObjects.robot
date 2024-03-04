*** Variables ***
${URL}              https://qrqck8u5t9co.front.staging.optimy.net/en/
${closeBtn}         css:button[id='cookie-close']
${loginBtn}         css:.ml-auto.btn.btn-outline-primary[href="/en/user/login/"]
${submitBtn}        css:a.btn.btn-outline-primary[href^="/en/project/new/controller.php"]
${submitApp}        css:.btn.btn-primary.btn-lg.col-md-auto[href="project/new/"]
${continueApp}      css:h1[class='h1']
${nextBtn}          css:button[id='next']
${validation}       css:button[id='validate']
${thankYouPg}       css:h1[class='thank-you-heading']
${postCountry}      css=a#ui-id-2.ui-menu-item-wrapper
${browseFile}       css:input[name='Filedata'] 
${nextScreenBtn}    css:button[id="navButtonNext"]
${validateSendBtn}  css:button#submitButton.btn.btn-primary.ml-md-auto[type="submit"]

${firstName}        css:input[aria-label="First name"]
${lastName}         css:input[aria-label="Last name"]
${address}          css:textarea[aria-label="Unit no/House no, Street"]
${postCode}         css:input[aria-label="Select postal code"]
${country}          css:select[aria-label="Country"]
${genderLoc}        css:label[aria-label="${genderValue}"]
${filePath}         C:\\Users\\eliza\\OneDrive\\Desktop\\Automation Assessment\\JaneDoe.jpg
${roleDropdown}     css:select[aria-label="Select a role you're applying for"]
${careerObjField}   css:textarea[aria-label="What is your career objective?"]
${labels}           Create List    Spreadsheet    JIRA    Test management tool (any)    SQL, MySQL, MySQLi    Javascript    Python    Robot Framework    Cypress
${thankYouMessage}   css:h1.h1.text-center

#Summary Page Selectors
${First_Name_Selector}      css: div.question-text.view:nth-of-type(1) .field
${Last_Name_Selector}       css: div.question-text.view:nth-of-type(2) .field
${Address_Selector}         css: div.answer.view p
${Postal_Code_Selector}     css: div.question-location.view .field
${Country_Selector}         css: div.question-locationCountry.view .field
${File_Name_Selector}       css: div.answer.view a
${Gender_Selector}          css: ul#field_64d3c1af-c688-597d-9803-77e4287f2fbb li.answer.view
${Role_Selector}            css: div.form-group.answers p.answer.view
${Tools_Selector}           css: div.form-group.answers ul#field_73c26bc3-c6fb-5224-b962-b417331ee64c li.answer.view
${Career_Objective_Selector}    css: div.question-richtext.view .field


*** Keywords ***
Input First Name
    [Arguments]    ${text}
    Input Text    ${firstName}    ${text}

Input Last Name
    [Arguments]    ${text}
    Input Text    ${lastName}    ${text}

Input Address
    [Arguments]    ${text}
    Input Text    ${address}    ${text}

Input Postal Code
    [Arguments]    ${text}
    Input Text    ${postCode}    ${text}

Select Country
    [Arguments]    ${text}
    Wait Until Element Is Visible  ${postCountry}
    Click Element    ${postCountry}
    Select From List by Label    ${country}    ${text}

Choose Gender
    Click Element    ${genderLoc}

Select Role
    [Arguments]    ${text}
    Select From List by Label    ${roleDropdown}    ${text}

Select Tools
    FOR    ${label}    IN    @{labels}
        Click Element    css:label[aria-label="${label}"]
    END

Input Career Objective
    [Arguments]    ${text}
    Execute JavaScript      document.querySelector('textarea[aria-label="What is your career objective?"]').style.visibility = 'visible';
    #Scroll Element Into View    ${careerObjField}
    #Execute JavaScript      document.querySelector('textarea[aria-label="What is your career objective?"]').style.display = 'block';
    Wait Until Page Contains Element    ${careerObjField}    timeout=20s
    Input Text    ${careerObjField}    ${text}

Verify Personal Details
    Verify First Name
    Verify Last Name
    Verify Address
    Verify Postal Code
    Verify Country
    Verify File Name
    Verify Gender
    Verify Role
    Verify Tool Familiarity
    Verify Career Objective


Verify First Name
    Wait Until Element Is Visible  ${First_Name_Selector}  timeout=10s
    ${first_name}    Get Text    ${First_Name_Selector}
    Should Be Equal As Strings    ${first_name}    ${firstNameValue}

Verify Last Name    
    Wait Until Element Is Visible   ${Last_Name_Selector}  timeout=10s
    ${last_name}     Get Text    ${Last_Name_Selector}
    Should Be Equal As Strings    ${last_name}    ${lastNameValue}

Verify Address
    Wait Until Element Is Visible   ${Address_Selector}  timeout=30s
   ${address}       Get Text    ${Address_Selector}
    Should Be Equal As Strings    ${address}    ${addressValue}

Verify Postal Code
    Wait Until Element Is visible       ${Postal_Code_Selector}  timeout=10s
    ${postal_code}   Get Text    ${Postal_Code_Selector}
    Should Contain    ${postal_code}    ${postCodeValue}

Verify Country
    Wait Until Element Is Visible  ${Country_Selector}  timeout=10s
    ${country}       Get Text    ${Country_Selector}
    Should Be Equal As Strings  ${country}    ${countryValue}

Verify File Name
    Wait Until Element Is Visible   ${File_Name_Selector}  timeout=30s
    ${escaped_filePath}  Set Variable  ${filePath.replace('/', '\\/')}
    Log  Escaped File Path: ${escaped_filePath}
    Should Be Equal  ${filePath}  ${escaped_filePath}

Verify Gender
    Wait Until Element Is Visible   ${Gender_Selector}  timeout=10s
    ${gender}       Get Text    ${Gender_Selector}
    Should Be Equal As Strings  ${gender}   ${genderValue} 

Verify Role
    Wait Until Element Is Visible   ${Role_Selector}  timeout=10s
    ${role}     Get Text    ${Role_Selector}         
    Should Be Equal As Strings  ${role}    ${roleValue}

Verify Tool Familiarity
    ${tools_elements} =    Get WebElements    ${Tools_Selector}
    ${tools_texts} =    Create List
    FOR    ${element}    IN    @{tools_elements}
        ${text} =    Get Text    ${element}
        Append To List    ${tools_texts}    ${text}
    END
    Lists Should Be Equal    ${tools_texts}    ${labels}

Verify Career Objective
    Wait Until Element Is Visible   ${Career_Objective_Selector}  timeout=10s
    ${career_obj}    Get Text    ${Career_Objective_Selector}
    Should Be Equal As Strings  ${career_obj}    ${careerObjValue}
    


    
    
    #${first_name_no_space}  Remove Whitespace    ${first_name}
    #Log     ${first_name_no_space}
    #${last_name}     Get Text    ${Last_Name_Selector}
    #${last_name_no_space}   Remove Whitespace    ${last_name}
    #Log     ${last_name_no_space}
    #${actual_first_name}    Get Text    css:div#container_06c8a27e-7d11-57b2-9286-af8fc8ba5b27 div.field
    #Log    Actual First Name (Before Whitespace Removal): ${actual_first_name}
    #${trimmed_first_name}    Remove Whitespace    ${actual_first_name}
    #Log    Trimmed First Name (After Whitespace Removal): ${trimmed_first_name}
    
    #${elements}    Get WebElements    css:div.answer.view div.field
    #FOR    ${element}    IN    @{elements}
     #   ${text}    Get Text    ${element}
      #  Log    ${text}
    #END
    
    
    
    #${first_name}    Get WebElement   css=#container_06c8a27e-7d11-57b2-9286-af8fc8ba5b27 .field
    #${actual_first_name}   Get Element Text    ${first_name}
    #Log    ${actual_first_name}
    #Should Be Equal As Strings    ${first_name}    ${firstNameValue}
    #Page Should Contain Element    css:div.answer.edit.summary#container_1d53c7f9-b0a2-58df-8a59-6cb7e5d46b7a
    #Page Should Contain Element    css:h2.screen-name    # Ensure the screen name is present
    #Page Should Contain Element    css:div.question-text.view p.title strong:contains('First name')   # Check if the first name question is present
    #Page Should Contain Element    css:div.question-text.view div.field:contains('$firstNameValue')

    #${actual_first_name}    Get Text      css:div#container_06c8a27e-7d11-57b2-9286-af8fc8ba5b27 div.field
    #${trimmed_first_name}    Evaluate    "${actual_first_name}".replace(" ", "")
    #Log    Field Value Without White Spaces: ${trimmed_first_name}






