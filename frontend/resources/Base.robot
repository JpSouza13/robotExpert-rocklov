*Settings*

Documentation    Arquivo principal do projeto de automação 
Library          libs/mongo.py
Library          Browser
Library          Collections
Resource         action/LoginAction.robot
Resource         Helpers.robot
Resource         action/EquipoActions.robot
Resource         Services.robot
Resource         action/Components.robot
Library          OperatingSystem

*Keywords*
Start Session
    New Browser    Chromium                                False    slowMo=00:00:01
    New Page       https://rocklov-jp-web.herokuapp.com
    #Set Viewport Size       1920        1080
Finish Test
    Take Screenshot

Take Screenshot And Logout
    Take Screenshot
    Do Logout

Take Screenshot And Go Back
    Take Screenshot
    Go Back

Login Session
    [Arguments]    ${email}    ${password}

    Start Session
    Login With       ${email}    ${password}



