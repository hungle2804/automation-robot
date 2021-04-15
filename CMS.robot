*** Settings ***
Resource          ../../CONFIG/CMS_KEYWORDS.robot
Resource          ../../CONFIG/CMS_variables.robot

*** Test Cases ***
TC1
    Open Launch
    Select Flights
    Select "Hanoi" in Leaving from
    Select "Ho Chi Minh" in Going to
    Select Current Date in Departing
    Select Next Date in Returning
    Click Search HN To HCM
    Sleep    3
    Close Browser

TC2
    Open Launch
    Select Flights
    Select "Hanoi" in Leaving from
    Select "Da Nang" in Going to
    Select Current Date in Departing
    Select Next Date in Returning
    Click Search HN to DN
    Sleep    3
    Select "Price (Lowest)" in Sort By filter
    Sleep    2
    Close Browser

TC3
    Open Launch
    Select Flights
    Select "Hanoi" in Leaving from
    Select "Da Nang" in Going to
    Select Current Date in Departing
    Select Next Date in Returning
    Click Search HN to DN
    Sleep    3
    Select "Price (Highest)" in Sort By filter
    Sleep    2
    Close Browser

TC4
    Open Launch
    Select Flights
    Select "Hanoi" in Leaving from
    Select "Da Nang" in Going to
    Select Current Date in Departing
    Select Next Date in Returning
    Click Search HN to DN
    Sleep    3
    Select "Duration (Shortest)" in Sort By filter
    Sleep    2
    Close Browser

TC5
    Open Launch
    Select Flights
    Select "Hanoi" in Leaving from
    Select "Da Nang" in Going to
    Select Current Date in Departing
    Select Next Date in Returning
    Click Search HN to DN
    Sleep    3
    Select "Duration (Longest)" in Sort By filter
    Sleep    2
    Close Browser
