*** Settings ***

Resource    resource.robot
Library    SeleniumLibrary

*** Test Cases ***
TC 001: No Destination
    Open Form Page
    Input Username    Somsong
    Input Passwords    Sandee
    Input Destination    ${EMPTY}
    Input Contact_Person    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    081-111-1234
    Submit Forms
    Form Should Fail With Message    “Please enter your destination.”
TC 002: No Email
    Open Form Page
    Input Username    Somsong
    Input Passwords    Sandee
    Input Destination    Europe
    Input Contact_Person    Sodsai Sandee
    Input Relationship    Mother
    Input Email    ${EMPTY}
    Input Phone    081-111-1234
    Submit Forms
    Form Should Fail With Message    “Please enter a valid email address.”

TC 003: No invalid Email
    Open Form Page
    Input Username    Somsong
    Input Passwords    Sandee
    Input Destination    Europe
    Input Contact_Person    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong
    Input Phone    081-111-1234
    Submit Forms
    Form Should Fail With Message    “Please enter a valid email address.”

TC 004: No Phone
    Open Form Page
    Input Username    Somsong
    Input Passwords    Sandee
    Input Destination    Europe
    Input Contact_Person    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    ${EMPTY}
    Submit Forms
    Form Should Fail With Message    “Please enter a phone number”

TC 004: No Phone
    Open Form Page
    Input Username    Somsong
    Input Passwords    Sandee
    Input Destination    Europe
    Input Contact_Person    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone    191
    Submit Forms
    Form Should Fail With Message    “Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678”