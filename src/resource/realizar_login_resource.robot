*** Settings ***
Documentation     Testes de Login
Library           Browser


*** Variables ***

${email}    testep@tmail.com
${senha}    123456
${senha_invalida}    1234567
${url}      https://challenge.primecontrol.com.br

*** Keywords ***

#CT003 - Realizar Login com sucesso
Dado que o usuário está na página de login

    New Browser    browser=chromium        headless=False
    New Page       ${url}/app
    
    Wait For Elements State   form h1    visible    5000
    Get Text                  form h1    equals    Login    
  
   
Quando o usuário insere suas credenciais corretas
    Fill Text  css=input[type="email"]                  ${email}  
    Fill Text  css=input[type="password"]               ${senha}

E clica no botão de login

    Click       css=button[type="button"]

Então o usuário é redirecionado para a página principal logado

    Wait For Elements State   div h1    visible    10000 
    

    Close Browser

#CT004 - Validar Login com senha inválida
Dado que o usuário está na página de login 2
    New Browser    browser=chromium        headless=False
    New Page       ${url}/app
    
    Wait For Elements State   form h1    visible    5000
    Get Text                  form h1    equals    Login    

Quando o usuário insere uma senha incorreta

    Fill Text  css=input[type="email"]                  ${email}  
    Fill Text  css=input[type="password"]               ${senha_invalida}

E clica no botão de login 2

    Click       css=button[type="button"]

Então uma mensagem de erro é exibida informando sobre a senha inválida
    
    Wait For Elements State   div[role="alert"]    visible    5000 
    Get Text    div[role="alert"]    equals    E-mail ou senha inválida.

    Close Browser

#CT010 - Realizar Logout com sucesso ao clicar em "Finalizar"
Dado que o usuário está logado
    New Browser    browser=chromium        headless=False
    New Page       ${url}/app
    
    Wait For Elements State   form h1    visible    5000
    Get Text                  form h1    equals    Login    
    Fill Text                 css=input[type="email"]                  ${email}  
    Fill Text                 css=input[type="password"]               ${senha} 
    
    Click                     css=button[type="button"]  
    
    Wait For Elements State   div h1    visible    10000 

    Click                     xpath=/html/body/div/div/nav/div/div/ul/li/a

Quando o usuário clica no botão de logout
    Wait For Elements State   div h6   visible    10000 
    Get Text                 div h6    equals    Para submeter os dados do projeto, clique em 'Enviar'. Se desejar sair, clique em 'Logout'.

    Click                    xpath=//*[@id="root"]/div/nav/div[2]/div/div/div/button[1]


Então o usuário é deslogado com sucesso

    Wait For Elements State   form h1    visible    5000
    Get Text                  form h1    equals    Login    

    Close Browser