*** Settings ***
Library    SeleniumLibrary
Variables  locators.yaml


*** Variable ***
${BROWSER}    chrome
${URL}        https://www.saucedemo.com/


*** Keywords ***
Access SauceDemo Website
    Open Browser  ${URL}  ${BROWSER}
    Wait Until Element Is Visible  ${HOME.TXT_TITLE_SCREEN}
