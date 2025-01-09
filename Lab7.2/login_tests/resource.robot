*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${DELAY}          0.1
${VALID USER}     demo
${VALID PASSWORD}    mode

${Form URL}        http://${SERVER}/Form.html
${Complete URL}    http://${SERVER}/Complete.html
${CHROME_BROWSER_PATH}    E:/Software_en/Lab7/Lab7_Soft_End/demomo/WebDemo/chrome/chrome-win64/chrome.exe
${CHROME_DRIVER_PATH}     E:/Software_en/Lab7/Lab7_Soft_End/demomo/WebDemo/chrome/chromedriver-win64/chromedriver.exe
*** Keywords ***
Open Form Page
    ${chrome_options}=   Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    # [selenium >= 4.10] `chrome_options` change to `options`
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To Form Page
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Form Page Should Be Open

Open Complete Page
    ${chrome_options}=   Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    # [selenium >= 4.10] `chrome_options` change to `options`
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To Complete Page
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Complete Page Should Be Open
# Open Browser To Form Page
#     Open Browser    ${Form URL}    ${BROWSER}
#     Maximize Browser Window
#     Set Selenium Speed    ${DELAY}
#     Form Page Should Be Open
Go To Complete Page
    Go To    ${Complete URL}
    Complete Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login Page

Form Page Should Be Open
    Title Should Be    Customer Inquiry

Go To Form Page
    Go To    ${Form URL}
    Form Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    firstname    ${username}

Input Passwords
    [Arguments]    ${password}
    Input Text    lastname    ${password}

Input Destination
    [Arguments]    ${destination}
    Input Text    destination    ${destination}

Input Contact_Person
    [Arguments]    ${contact_person}
    Input Text    contactperson    ${contact_person}

Input Relationship
    [Arguments]    ${relationship}
    Input Text    relationship    ${relationship}

Input Email
    [Arguments]    ${email}
    Input Text    email    ${email}

Input Phone
    [Arguments]    ${phone}
    Input Text    phone    ${phone}

Submit Credentials
    Click Button    login_button

Submit Forms
    Click Button    submitButton

Form Should Success
    Title Should Be    Seccess

Form Should Fail With Message
    [Arguments]    ${message}
    Page Should Contain    ${message}

Form Should Seccess With Message
    [Arguments]    ${message}
    Page Should Contain    ${message}

complete Page Should Be Open
    Title Should Be    Completed