*** Settings ***
Library           DateTime
Library           String
Library           Selenium2Library

*** Variables ***
${url}            https://www.expedia.com/
${browser}        chrome
${more-travel-btn}    //div[@id="gc-custom-header-tool-bar-shop-menu"]
${flights-btn}    //div[@class="uitk-type-300" and contains(text(),"Flights")]
${element-leaving-from}    //button[@aria-label="Leaving from" and @type="button"]
${input-leaving-from}    //input[@id="location-field-leg1-origin"]
${element-going-to}    //button[@aria-label="Going to" and @type="button"]
${input-going-to}    //input[@id="location-field-leg1-destination"]
${element-sort-by}    //div//div[@class="uitk-flex-item"]//select[@id="listings-sort"]
${element-price-lowest}    //div//div[@class="uitk-flex-item"]//select[@id="listings-sort"]/option[@value="PRICE_INCREASING"]
${element-price-highest}    //div//div[@class="uitk-flex-item"]//select[@id="listings-sort"]/option[@value="PRICE_DECREASING"]
${element-price-duration-shortest}    //div//div[@class="uitk-flex-item"]//select[@id="listings-sort"]/option[@value="DURATION_INCREASING"]
${element-price-duration-longest}    //div//div[@class="uitk-flex-item"]//select[@id="listings-sort"]/option[@value="DURATION_DECREASING"]
${element-button-departing}    //button[@id="d1-btn"]
${element-button-returning}    //button[@id="d2-btn"]
${button-search}    //button[contains(text(),'Search')]
${button-flights}    //button[@class="uitk-card-link"]
${element-hcm}    //span[contains(text(),"from Hanoi") and contains(text(),"in Ho Chi Minh")]
${element-dn}     //span[contains(text(),"from Hanoi") and contains(text(),"in Da Nang")]
${check1}         from Hanoi
${check2}         in Ho Chi Minh City
${check3}         in Da Nang
${price}          //span[@class="uitk-lockup-price"]
${duration-time}    //div[@class="uitk-type-200 uitk-text-emphasis-theme"]
