*** Settings ***
Documentation    This is some basic information about the whole suite
Library  SeleniumLibrary
Library     OperatingSystem


*** Variables ***


*** Test Cases ***
User must sign in to check out
    [Documentation]  This is some basic information trying to do about the test case
    [Tags]    DEBUG

#  ${chromeOptions}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
#    Call Method    ${chromeOptions}    add_argument    --headless
#    Call Method    ${chromeOptions}    add_argument    --window-size\=1980,1080
#    Call Method    ${chromeOptions}    add_argument    --disable-gpu
#    Call Method    ${chromeOptions}    add_argument    --no-sandbox
#    Call Method    ${chromeOptions}    add_argument    --ignore-certificate-errors
#    Call Method    ${chromeOptions}    add_argument    --disable-dev-shm-usage
#    Create Webdriver    Chrome          chrome_options=${chromeOptions}
    Open Browser       http://amazon.com    headlesschrome
    Close Browser


