*** Settings ***
Library    SeleniumLibrary
Variables  personal.yaml
Variables  ../locators.yaml


*** Keywords ***
Enter Username
    [Arguments]  ${username}
    Wait Until Element Is Visible  ${HOME.INPUT_USERNAME}
    Input Text  ${HOME.INPUT_USERNAME}  ${username}

Enter Password
    [Arguments]  ${password}
    Wait Until Element Is Visible  ${HOME.INPUT_PASSWORD}
    Input Password  ${HOME.INPUT_PASSWORD}  ${password}

Click On Login Button
    Wait Until Element Is Visible  ${HOME.BTN_LOGIN}
    Click Button  ${HOME.BTN_LOGIN}

Log Into SauceDemo Website
    Enter username  ${STANDARD_USER}
    Enter password  ${PASSWORD}
    Click On Login Button

Verify That The User Is Successfully Logged
    Wait Until Element Is Visible  ${INVENTORY.TXT_TITLE_CATEGORY}
    Wait Until Element Is Visible  ${INVENTORY.ICON_CART}

The User Logs Into The Web App
    Log Into SauceDemo Website
    Verify That The User Is Successfully Logged