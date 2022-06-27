*Settings*
Documentation    Add Equipos Tests
Resource         ${Execdir}/resources/Base.robot

*Test Cases*
Add New Equipos

    ${token}            Get token               kakashi@yahoo.com     abc123
    ${equipo}           Get Json                equipos               fender.json
    
    Remove Equipo       ${equipo}[payload][name]

    ${response}      POST Equipo      ${equipo}     ${token}    

    Status Should Be      200         ${response}




