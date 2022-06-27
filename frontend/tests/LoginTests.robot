*Settings*
Documentation    Login Testes

Resource    ${EXECDIR}/resources/Base.robot


Suite Setup      Start Session
Test Teardown    Finish Test

*Test Cases*

User Login
    [Tags]    ok_login

    Login With                 Ichigo@yahoo.com       abc123
    User Should Be Logged In 
    [Teardown]                 Take Screenshot And Logout                      

Incorrect Password
    [Tags]    attempt_login

    Login With                 Ichigo@yahoo.com       abc122
    Alert Text Should Be       Usuário e/ou senha inválidos.

Incorrect Email
    [Tags]    attempt_login

    Login With                 Ichigo&yahoo.com       abc123 
    Alert Text Should Be       Oops. Informe um email válido!

    
User not Found
    [Tags]    attempt_login

    Login With                 404@yahoo.com         abc123
    Alert Text Should Be       Usuário e/ou senha inválidos.


Empty Email
    [Tags]    Empty_login

    Login With                  ${EMPTY}             abc123
    Alert Text Should Be        Oops. Informe um email válido!

Empty Password
    [Tags]    Empty_login

    Login With                 Ichigo@yahoo.com        ${EMPTY}  
    Alert Text Should Be       Oops. Informe sua senha secreta!


