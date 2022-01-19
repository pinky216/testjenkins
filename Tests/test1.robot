*** Settings ***
Documentation    This is some basic information about the whole suite
Library  SeleniumLibrary

*** Variables ***


*** Test Cases ***
User must sign in to check out
    [Documentation]  This is some basic information trying to do about the test case
    [Tags]    DEBUG
    Open Browser    http://www.amazon.com       firefox
    Sleep   3s
    Close Browser


