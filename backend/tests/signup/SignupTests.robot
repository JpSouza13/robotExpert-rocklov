*Settings*

Documentation    Signup Testes
Resource         ${Execdir}/resources/Base.robot


* Test Cases *
Add New User

    ${payload}              Get Json               signup         new_user.json
    Remove User by Email    ${payload['email']}    
    ${response}             POST User              ${payload}
    Status Should Be        200                    ${response}    

Duplicated Email

    ${payload}          Get Json      signup    duplicated_email.json

    POST User           ${payload}  #post sem armazenamento em variavel.

    ${response}         POST User    ${payload}
    Status Should Be    409          ${response}    


