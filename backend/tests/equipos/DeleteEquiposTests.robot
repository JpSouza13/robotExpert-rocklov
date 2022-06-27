*Settings*
Documentation    Delete Equipos Tests

Resource    ${Execdir}/resources/Base.robot    

*Test Cases*

Delete A Equipo

    ${token}     Get token    kakashi@yahoo.com     abc123
    ${equipo}    Get Json     equipos               violino.json


    Remove Equipo    ${equipo}[payload][name]
    ${result}        POST Equipo                 ${equipo}    ${token}        
    ${equipo_id}     Set Variable                ${result.json()}[_id]
    ${response}      DELETE Equipo               ${token}     ${equipo_id}

    Status Should Be                204          ${response}
    ${response2}     Get Unique Equipo           ${token}     ${equipo_id}
    Status Should Be                404          ${response2} 

Equipo Not Found
    
    ${equipo_id}        Get Mongo Id
    ${token}            Get token           kakashi@yahoo.com       abc123
    ${response}         DELETE Equipo       ${token}                ${equipo_id}

    Status Should Be    204                 ${response}        