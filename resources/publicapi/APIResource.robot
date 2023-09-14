*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    SeleniumLibrary


*** Variables ***
${HOST}                https://api.publicapis.org/
${ENTRIES_ENDPOINT}    /entries


*** Keywords ***
The User Has a Session For The PublicAPI Host
    Create Session    publicapis  ${HOST}  

The User Makes A Request To The Entries API
    ${response} =    GET On Session    publicapis    ${ENTRIES_ENDPOINT}
    Set Test Variable    ${response}

A Filter Is Applied To The Response For The Category ${category}
    @{filtered_entries} =    Evaluate    [entry for entry in ${response.json()['entries']} if entry['Category'] == ${category}]
    Set Test Variable    ${filtered_entries}

The Entries Response Should Be Successful With Correct Fields
    Should Be Equal As Strings    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    count
    Dictionary Should Contain Key    ${response.json()}    entries

The Count Field Should Have The Same Value As The Length Of The Entries List
    ${entries_count} =    Evaluate    len(${response.json()['entries']})
    Should Be Equal    ${response.json()['count']}    ${entries_count}

The Filtered Entries List Should Not Be Empty
    Should Not Be Empty    ${filtered_entries}

The Filtered Entries Should Be Logged To Console
    FOR    ${element}    IN    @{filtered_entries}
       Log To Console    ${element}
    END
     