*Settings*
Documentation    Get Equipos Tests

Resource    ${Execdir}/resources/Base.robot    

*Test Cases*

Get Unique

    ${token}     Get token    minato@yahoo.com       abc123
    ${equipo}    Get Json     equipos               piano.json


    Remove Equipo    ${equipo}[payload][name]
    ${result}        POST Equipo                 ${equipo}                ${token}        
    ${equipo_id}     Set Variable                ${result.json()}[_id]
    ${response}      Get Unique Equipo           ${token}                 ${equipo_id}

    Status Should Be    200                             ${response}
    Should Be Equal     ${equipo}[payload][name]        ${response.json()}[name]
    Should Be Equal     ${equipo}[payload][category]    ${response.json()}[category]
    Should Be Equal     ${equipo}[payload][price]       ${response.json()}[price]

Equipo Not Found

    ${equipo_id}    Get Mongo Id
    ${token}        Get token            kakashi@yahoo.com     abc123
    ${response}     Get Unique Equipo    ${token}              ${equipo_id}

    Status Should Be    404    ${response}    

Get Equipo List

    ${token}    Get Token    ritalee@yahoo.com     abc123
    ${list}     Get Json     equipos               list.json

    FOR     ${item}          IN          @{list}    
            Remove Equipo    ${item}[payload][name]
            POST Equipo      ${item}         ${token}
    END

    ${response}         Get Equipos     ${token}
    Status Should Be    200             ${response}
    ${total}            Get Length      ${response.json()}
    Should Be True      ${total} > 0

