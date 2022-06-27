*Settings*
Documentation    Remove Equipos Tests               
Resource         ${EXECDIR}/resources/Base.robot

Suite Setup      Login Session    ${EMAIL}    ${PASSWORD}
Test Teardown    Finish Test
    

*Variables*
${EMAIL}       jimmi.hendrix@hotmail.com
${PASSWORD}    abc123
    


*Test Cases*
Remove Equipo
    [Tags]    remove
    # Dado que saxofone é um equipamento indesejado

    ${equipo}              Get Equipo           saxofone
    #Set Token From LS                                     #
    ${token}               Get Token Service    ${EMAIL}    ${PASSWORD}    #
    Remove Equipo          ${equipo}[name]
    POST Equipo Service    ${equipo}            ${token}
    Reload
    Request Removal        ${equipo}[name]      
    Confirm Removal


    Equipo Not Should Be visible    ${equipo}[name]    

Give up Removal
    [Tags]       remove
    ${equipo}    Get Equipo    conga

    #Set Token From LS
    ${token}                    Get Token Service    ${EMAIL}    ${PASSWORD}
    Remove Equipo               ${equipo}[name]
    POST Equipo Service         ${equipo}            ${token}
    Reload
    Request Removal             ${equipo}[name]      
    Cancel Removal
    Equipo Should Be Visible    ${equipo}[name]
    Sleep                       2