*Settings*
Documentation                  Equipo Actions

*Keywords*
Go To Equipo Form
    Click                      text=Criar anúncio
    Wait For Elements State    id=equipoForm         visible    5

Fill Equipo Form 
    [Arguments]          ${equipo}
    
    ${promise}=          Promise To Upload File    ${EXECDIR}/resources/fixtures/thumbnails/${equipo}[thumbnail]
    Click                id=thumbnail
    Wait For             ${promise}
    Fill Text            id=name                   ${equipo}[name]
    Select Options By    id=category               Value               ${equipo}[category]
    Fill Text            id=price                  ${equipo}[price]

Submit Equipo Form
    #[Arguments]          ${equipo}              
    
    Click                text=Cadastrar


Equipo Should Be visible
    [Arguments]          ${equipo_name}

    Wait For Elements State    
    ...                  css=tr >> text=${equipo_name}
    ...                  visible
    ...                  5
    ...                  Equipo Not Be Visible 


Equipo Not Should Be visible
    [Arguments]          ${equipo_name}

    Wait For Elements State    
    ...                  css=tr >> text=${equipo_name}
    ...                  detached
    ...                  5
    ...                  Equipo Not Be Visible 



Alert Form Should Be 
    [Arguments]          ${expect_message}

    Wait For Elements State   
    ...                  css=.alert-form >> text=${expect_message}      # Junçao das duas funcionalidades para aumentar a localizaçao
    ...                  visible
    ...                  5

Get Text For Required Alerts
    [Arguments]        ${position}

    ${result}          Get Text         xpath=//span[@class="alert-form"][${position}]

    [Return]           ${result}

Request Removal
    [Arguments]        ${equipo_name}
    Click              xpath=//td[text()="${equipo_name}"]/..//i[contains(@class,"delete-icon")]

Confirm Removal        
    Click              xpath=//div[@class="react-confirm-alert"]//button[text()="Sim"]

Cancel Removal        
    Click              xpath=//div[@class="react-confirm-alert"]//button[text()="Não"]