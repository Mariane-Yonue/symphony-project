*** Settings ***
Resource        resources/saucedemo/MainResource.robot
Resource        resources/saucedemo/login/LoginResource.robot
Resource        resources/saucedemo/inventory/InventoryResource.robot
Test Setup      Access SauceDemo Website
Test Teardown   Close Browser


*** Test Cases ***
Validate The Default Alphabetical Inventory Sort
    [Documentation]  This test case verifies that when the user logs into the website
    ...              the products are alphabetically ascending (A-Z) sorted           
    [Tags]  Login Inventory Sort

    Given The User Logs Into The Web App 
    When The Selected Sort Is The Default Option
    Then The Products Must Be A-Z Sorted


Validate The Descending Alphabetical Inventory Sort
    [Documentation]  This test case verifies that given the user is in the Inventory page,
    ...              when the alphabetical descending (Z -A) sort option is selected
    ...              all products are correctly ordered
    [Tags]  Inventory Sort

    Given The User Logs Into The Web App
    When The User Selects The 'Name (Z to A)' Sort Option
    Then The Products Must Be Z-A Sorted