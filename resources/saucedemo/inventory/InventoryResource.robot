*** Settings ***
Library    SeleniumLibrary
Library    Collections
Variables  constants.yaml
Variables  ../locators.yaml


*** Keywords ***
Verify That The Alphabetical Ascending Sort Is Selected
    Wait Until Element Is Visible  ${INVENTORY.TXT_ACTIVE_SORT}
    Element Text Should Be  ${INVENTORY.TXT_ACTIVE_SORT}  ${SORT_OPTION.DEFAULT}

Verify That The Selected Sort Option Is The Expected Option
    [Arguments]  ${sort_option}
    Wait Until Element Is Visible  ${INVENTORY.TXT_ACTIVE_SORT}
    Element Text Should Be  ${INVENTORY.TXT_ACTIVE_SORT}  ${sort_option}

Get Product Names
    @{products} =    Get WebElements    ${INVENTORY.TXT_INVENTORY_ITEM_NAME}
    @{product_names} =    Create List

    FOR    ${element}    IN    @{products}
        Append To List    ${product_names}    ${element.text}
    END

    Return From Keyword    ${product_names}

The Selected Sort Is The Default Option
    Verify That The Alphabetical Ascending Sort Is Selected
    
The User Selects The '${sort_option}' Sort Option
    Wait Until Element Is Visible  ${INVENTORY.SELECT_CONTAINER_SORT}
    Select From List By Label    ${INVENTORY.SELECT_CONTAINER_SORT}  ${sort_option}
    Verify That The Selected Sort Option Is The Expected Option    ${sort_option}

The Products Must Be A-Z sorted
    @{product_names} =    Get Product Names
    @{sorted_product_names} =    Evaluate    sorted(${product_names})
    Lists Should Be Equal    ${product_names}    ${sorted_product_names}

The Products Must Be Z-A Sorted
    @{product_names} =    Get Product Names
    @{sorted_product_names} =    Evaluate    sorted(${product_names}, reverse=True)
    Lists Should Be Equal    ${product_names}    ${sorted_product_names}