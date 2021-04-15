*** keywords ***
Open Launch
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Select Flights
    Sleep    2
    Click Element    ${more-travel-btn}
    Sleep    3
    Click Element    ${flights-btn}
    Sleep    2
    Page Should Contain Element    //h1[contains(text(),"Search flights")]

Select "Hanoi" in Leaving from
    Click Element    ${element-leaving-from}
    Input Text    ${input-leaving-from}    Ha Noi
    Press Keys    None    ENTER

Select "Ho Chi Minh" in Going to
    Click Element    ${element-going-to}
    Input Text    ${input-going-to}    Ho Chi Minh
    Press Keys    None    ENTER

Select "Da Nang" in Going to
    Click Element    ${element-going-to}
    Input Text    ${input-going-to}    Da Nang
    Press Keys    None    ENTER
    Sleep    3

Select "Price (Lowest)" in Sort By filter
    Click Element    ${element-sort-by}
    Click Element    ${element-price-lowest}
    Sleep    5
    ${count}    Set Variable    0
    ${list-elements}=    Get WebElements    ${price}
    FOR    ${price}    IN    @{list-elements}
        ${text}=    Get Text    ${price}
        ${text}=    Remove String    ${text}    $
        Run Keyword IF    ${count} > 0    Run keywords    log to console    ======start======
        ...    AND    log to console    Qua Khu
        ...    AND    log to console    ${history}
        ...    AND    log to console    hien tai
        ...    AND    log to console    ${text}
        ...    AND    log to console    =====end======
        ...    AND    Should Be True    ${history} <= ${text}
        ${history}=    Set Variable    ${text}
        ${count}    Set Variable    1
    END

Select "Price (Highest)" in Sort By filter
    Click Element    ${element-sort-by}
    Click Element    ${element-price-highest}
    Sleep    5
    ${count}    Set Variable    0
    ${list-elements}=    Get WebElements    ${price}
    FOR    ${price}    IN    @{list-elements}
        ${text}=    Get Text    ${price}
        ${text}=    Remove String    ${text}    $
        Run Keyword IF    ${count} > 0    Run keywords    log to console    =====start=========
        ...    AND    log to console    Qua Khu
        ...    AND    log to console    ${history}
        ...    AND    log to console    hien tai
        ...    AND    log to console    ${text}
        ...    AND    log to console    =====end=========
        ...    AND    Should Be True    ${history} >= ${text}
        ${history}=    Set Variable    ${text}
        ${count}    Set Variable    1
    END

Select "Duration (Shortest)" in Sort By filter
    Click Element    ${element-sort-by}
    Click Element    ${element-price-duration-shortest}
    Sleep    5
    ${count}    Set Variable    0
    ${list-elements}=    Get WebElements    ${duration-time}
    FOR    ${duration-time}    IN    @{list-elements}
        ${time}=    Get Text    ${duration-time}
        ${time}=    Remove String    ${time}    h    m    Nonstop    (    )
        ${hours}=    Get Substring    ${time}    0    2
        ${minutes}=    Get Substring    ${time}    2    4
        Run Keyword If    ${count}>0    Run Keywords    Log to console    =========Start======
        ...    AND    Log to Console    Qua Khu Gio
        ...    AND    Log to console    ${history-hours}
        ...    AND    Log to console    Hien Tai Gio
        ...    AND    Log to console    ${hours}
        ...    AND    Log to Console    Qua Khu Phut
        ...    AND    Log to console    ${history-minutes}
        ...    AND    Log to console    Hien Tai Phut
        ...    AND    Log to console    ${minutes}
        ...    AND    Log to console    =========END===========
        ...    AND    Should Be True    ${history-hours} <= ${hours}
        ...    AND    Run Keyword If    ${hours}==${history-hours}    Should Be True    ${history-minutes}<=${minutes}
        ${history-hours}=    Set Variable    ${hours}
        ${history-minutes}=    Set Variable    ${minutes}
        ${count}    Set Variable    1
    END

Select "Duration (Longest)" in Sort By filter
    Click Element    ${element-sort-by}
    Click Element    ${element-price-duration-longest}
    Sleep    5
    ${count}    Set Variable    0
    ${list-elements}=    Get WebElements    ${duration-time}
    FOR    ${duration-time}    IN    @{list-elements}
        ${time}=    Get Text    ${duration-time}
        ${time}=    Remove String    ${time}    h    m    Nonstop    (    )
        ${hours}=    Get Substring    ${time}    0    2
        ${minutes}=    Get Substring    ${time}    2    4
        Run Keyword If    ${count}>0    Run Keywords    Log to console    =========Start======
        ...    AND    Log to Console    Qua Khu Gio
        ...    AND    Log to console    ${history-hours}
        ...    AND    Log to console    Hien Tai Gio
        ...    AND    Log to console    ${hours}
        ...    AND    Log to Console    Qua Khu Phut
        ...    AND    Log to console    ${history-minutes}
        ...    AND    Log to console    Hien Tai Phut
        ...    AND    Log to console    ${minutes}
        ...    AND    Log to console    =========END===========
        ...    AND    Should Be True    ${history-hours} >= ${hours}
        ...    AND    Run Keyword If    ${hours}==${history-hours}    Should Be True    ${history-minutes}>=${minutes}
        ${history-hours}=    Set Variable    ${hours}
        ${history-minutes}=    Set Variable    ${minutes}
        ${count}    Set Variable    1
    END

Select Current Date in Departing
    Click Button    //button[@id="d1-btn"]
    Sleep    2
    ${date1} =    Get Current Date    result_format=Apr %d, %Y.
    log to console    ${date1}
    ${today1} =    Replace String    ${date1}    0    ${EMPTY}    1
    Click Button    //button[@type="button" and contains(@aria-label,"${today1}")]
    Click Button    //div[@class="uitk-flex uitk-date-picker-menu-footer"]//button[@type="button"]

Select Next Date in Returning
    Click Button    //button[@id="d2-btn"]
    Sleep    2
    ${date2} =    Get Current Date    result_format=%Y,%m,%d
    log to console    ${date2}
    ${nextday} =    Add Time To Date    ${date2}    1 days    result_format=Apr %d, %Y
    #${result} =    Replace String    ${nextday}    0    ${EMPTY}    1
    Click Button    //button[@type="button" and contains(@aria-label,"${nextday}")]
    Click Button    //div[@class="uitk-flex uitk-date-picker-menu-footer"]//button[@type="button"]

Click Search HN To HCM
    Click Button    ${button-search}
    #Click Button    //button[@type="button" and @name="showMoreButton"]
    Sleep    5
    ${elements-hcm}=    Get WebElements    ${button-flights}
    FOR    ${element-hcm}    IN    @{elements-hcm}
        ${text-hcm}=    Get Text    ${element-hcm}
        Element Should Contain    ${element-hcm}    ${check1}
        Element Should Contain    ${element-hcm}    ${check2}
    END

Click Search HN To DN
    Click Button    ${button-search}
    #Click Button    //button[@type="button" and @name="showMoreButton"]
    Sleep    5
    ${elements-dn}=    Get WebElements    ${button-flights}
    FOR    ${element-dn}    IN    @{elements-dn}
        ${text-dn}=    Get Text    ${element-dn}
        Element Should Contain    ${element-dn}    ${check1}
        Element Should Contain    ${element-dn}    ${check3}
    END

Show More Flights
    Click Button    //button[@type="button" and @name="showMoreButton"]
