*Settings*
Documentation       Sessions Attempt Login Tests   

Resource            ${Execdir}/resources/Base.robot    #Execdir INFORMA O PATH ABSOLUTO.
Test Template       Attempt Login


*Test Cases*            json_file               status_code           message

Incorrect password      incorrect_pass.json         401             Unauthorized
User not Found          user_not_found.json         401             Unauthorized
Wrong email             wrong_email.json            412             wrong email
Empty email             empty_email.json            412             required email
Empty Password          empty_password.json         412             required password    
Without email           without_email.json          412             required email
Without Password        without_password.json       412             required password    




* Keywords *
Attempt Login
    [Arguments]    ${json_file}           ${status_code}           ${message}    

    ${payload}          Get Json          sessions          ${json_file}
    ${response}         POST Login        ${payload} 
    Status Should Be    ${status_code}    ${response}
    Should Be Equal     ${message}        ${response.json()}[error]