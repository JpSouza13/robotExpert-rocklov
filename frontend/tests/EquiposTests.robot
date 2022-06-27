*Settings* 
Documentation    Equipos Tests                      
Resource         ${EXECDIR}/resources/Base.robot

Suite Setup      Login Session      ${EMAIL}    ${PASSWORD}
Test Teardown    Finish Test

*Variables*
${EMAIL}         eddie@vanhalen.com
${PASSWORD}      abc123

*Test Cases*

Add New Equipos
    ${equipo}                   Get Equipo            violao
    Remove Equipo               ${equipo}[name]       
    Go To Equipo Form
    Fill Equipo Form            ${equipo}
    Submit Equipo Form          
    Equipo Should Be Visible    ${equipo}[name]       



Duplicated Equipo
    [Tags]                 dup_equipo
    ${equipo}              Get Equipo               fender
    Remove Equipo          ${equipo}[name]
    
    ${token}               Get Token Service        ${EMAIL}    ${PASSWORD}
    POST Equipo Service    ${equipo}                ${token}
    
    Go To Equipo Form
    Fill Equipo Form       ${equipo}
    Submit Equipo Form     


    # # Então devo ver a mensagem de alerta "Anuncio já existe :/"
    Alert Text Should Be    Anúncio já existe :/

    [Teardown]              Take Screenshot And Go Back


Required Fields
    [Tags]                  required_test

    @{expected_alert}       Create List     
    ...                     Adicione uma foto no seu anúncio.       
    ...                     Informe a descrição do anúncio.
    ...                     Escolha uma categoria.        
    ...                     Informe o valor da diária.
    
    @{got_alerts}           Create List
    
    Go To Equipo Form
    Submit Equipo Form      

    FOR     ${position}         IN RANGE       1   5
            ${text}             Get Text For Required Alerts   ${position}
            Append To List      ${got_alerts}       ${text}    
    END
    #Log To Console              ${got_alerts}
    Lists Should Be Equal       ${got_alerts}       ${expected_alert}
  




   




    

