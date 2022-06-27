*Settings*
Documentation       Login Actions

*Keywords*
Login With
    [Arguments]                ${email}         ${Password}

    Fill Text                  css=input[placeholder$=email]             ${email}
    Fill Text                  css=input[placeholder*="senha"]           ${Password}
    Click                      text=Entrar

Do Logout
    Click                      css=.do-Logout


User Should Be Logged In
    Wait For Elements State    .dashboard            visible             8    Login error



   

