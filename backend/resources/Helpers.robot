*Settings*

Documentation    Aqui teremos a KWs de ajuda 

Library    OperatingSystem


*keywords*
Get Json
    [Arguments]    ${route}    ${filename}
    ${fixture}     Get File    ${Execdir}/resources/fixtures/${route}/${filename}
    ${json}        Evaluate    json.loads($fixture)            json
    [Return]       ${json}

Get token
    [Arguments]    ${email}    ${password}

    &{payload}    Create Dictionary    email=${email}    password=${password}

    ${response }     POST Login       ${payload}
    ${user_token}    Set Variable     ${response.json()}[user_token]
    [Return]         ${user_token}
