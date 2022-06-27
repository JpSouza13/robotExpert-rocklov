*Settings*
Documentation       Implementaçao da Rota /Sessions


*Keywords*

POST Login
    [Arguments]     ${payload}
    ${response}     POST     
        ...         ${base_url}/sessions
        ...         json=${payload}
        ...         expected_status=any

    [Return]        ${response}

