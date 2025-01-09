*** Settings ***

Resource    resource.robot
Library    SeleniumLibrary

*** Test Cases ***
Register Success
    Open Form Page
    Input Username    Somsong
    Input Passwords    Sandee
    Input Destination    Europe
    Input Contact_Person    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    081-111-1234
    Submit Forms
    Form Should Seccess With Message    “Our agent will contact you shortly Thank you for your patient.”