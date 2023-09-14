*** Settings ***
Resource        resources/publicapi/APIResource.robot


*** Test Cases ***
Validate Entries Response Is Correct
    [Documentation]  Checks if the response from the API is successful and contains expected fields
    [Tags]  Entries

    Given The User Has a Session For The PublicAPI Host
    When The User Makes A Request To The Entries API
    Then The Entries Response Should Be Successful With Correct Fields
    And The Count Field Should Have The Same Value As The Length Of The Entries List


Validate Existence Of Entries With Category Authentication & Authorization
    [Documentation]  Checks if the list of entries with category Authentication & Authorization
    ...              is not empty, and also logs all the filtered entries to the console
    [Tags]  Entries
    
    Given The User Has a Session For The PublicAPI Host
    When The User Makes A Request To The Entries API
    And A Filter Is Applied To The Response For The Category 'Authentication & Authorization'
    Then The Filtered Entries List Should Not Be Empty
    And The Filtered Entries Should Be Logged To Console