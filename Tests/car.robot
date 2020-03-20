*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Variables ***
${BROWSER} =  chrome


*** Test Cases ***
Dropdown
    [Tags]    Dropdown
    Open Browser    about:blank  ${BROWSER}
    Maximize Browser Window
    Go To   http://carrental.infotiv.se/webpage/html/gui/index.php
    Input Text  id:email  josefine.osterlund@infotiv.se
    Input Text  id:password     infotiv
    Click Button    id:login
    Click Button    id:continue
    Click Button       xpath://*[@id="bookQ7pass5"]
    Click Element       xpath://*[@id="confirmSelection"]/form/select[1]
    Click Element   id:month2
    Click Element   xpath://*[@id="confirmSelection"]/form/select[2]
    Sleep  3 s
    Close Browser

Alert
    [Tags]  Alert
    Open Browser    about:blank  ${BROWSER}
    Maximize Browser Window
    Go To   http://carrental.infotiv.se/webpage/html/gui/index.php
    Input Text  id:email  josefine.osterlund@infotiv.se
    Input Text  id:password     inf
    #Click Button    id:login
    ${validation_message}  Get Element Attribute   id:password     validationMessage
    log  ${validation_message}
    Should Not Be Empty     ${validation_message}
    Element Attribute Value Should Be   id:password     required       true
    Sleep  3 s
    Close Browser

Card number
    [Tags]  Card
    Open Browser    about:blank  ${BROWSER}
    Maximize Browser Window
    Go To   http://carrental.infotiv.se/webpage/html/gui/index.php
    Input Text  id:email  josefine.osterlund@infotiv.se
    Input Text  id:password     infotiv
    Click Button    id:login
    Click Button    id:continue
    Click Button    id:bookQ7pass5
    ${too_long_card_number}  Set Variable   123456789123456789
    Input Text      id:cardNum      ${too_long_card_number}
    ${cut_card_number}  Get Value       id:cardNum
    Should Not Be Equal     ${too_long_card_number}  ${cut_card_number}
    Close Browser

*** Keywords ***
Begin Web Test
    Open Browser    about:blank  ${BROWSER}
    Maximize Browser Window
