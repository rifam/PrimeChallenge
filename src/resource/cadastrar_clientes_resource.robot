*** Settings ***
Library           Browser
Library           SeleniumLibrary
*** Variables ***

${email}            testep@tmail.com
${senha}            123456
${telefone}         11999999999   
${url}              https://challenge.primecontrol.com.br
${nome}             Teste
${seletorNome}      //*[@id="root"]/div/div/div/div[2]/div/form/div[1]/div/div[1]/input
${cep}              00000000
${seletorCEP}       //*[@id="root"]/div/div/div/div[2]/div/form/div[3]/div/div[1]/input
${numero}           13432
${seletorNumero}    //*[@id="root"]/div/div/div/div[2]/div/form/div[3]/div/div[2]/input
${Endereco}         Rua teste
${seletorEndereco}  //*[@id="root"]/div/div/div/div[2]/div/form/div[4]/div/div[1]/input 
${complemento}      apto 1
${seletorComplemento}  //*[@id="root"]/div/div/div/div[2]/div/form/div[4]/div/div[2]/input

*** Keywords ***


#CT005 - Realizar Cadastro de Clientes com sucesso na aba Perfil
Dado que o usuário está na página de cadastro de clientes1
    
    New Browser    browser=chromium        headless=False
    New Page       ${url}/app
    
    Wait For Elements State   form h1    visible    5000
    Get Text                  form h1    equals    Login    
    Fill Text                 css=input[type="email"]                  ${email}  
    Fill Text                 css=input[type="password"]               ${senha} 
    
    Click                     css=button[type="button"]  
    
    Wait For Elements State   div h1    visible    10000 

    Click                     xpath=//*[@id="root"]/div/div/div/div[2]/ul/li[2]/a

Quando o usuário preenche os campos obrigatórios com dados válidos

    Fill Text                 xpath=${seletorNome}                ${nome} 
    Fill Text                 css=input[type="tel"]               ${telefone}
    Fill Text                 css=input[type="email"]             ${email}
    Fill Text                 xpath=${seletorCEP}                 ${cep}
    Fill Text                 xpath=${seletorNumero}              ${numero}
    Fill Text                 xpath=${seletorEndereco}            ${Endereco} 
    Fill Text                 xpath=${seletorComplemento}         ${complemento}
    Upload File By Selector   css=.image-upload-label            ${EXECDIR}/mclovindriver.png
    Browser.Click              xpath=//*[@id="root"]/div/div/div/div[2]/div/form/div[4]/div/div[3]/select
    Sleep    2s
    select from list by value  xpath=//*[@id="root"]/div/div/div/div[2]/div/form/div[4]/div/div[3]/select/option[3]  Estados Unidos
    
    Click                     css=input[value="masculino"]
    Click                     css=input[value="robot"]
    
    Sleep                     5s
   
E clica no botão de cadastrar

    Click                     css=button[type="submit"]

Então o cliente é cadastrado com sucesso

    Wait For Elements State   div h1    visible    10000
    Get Text                  div h1    equals    Clientes

    Close Browser

#CT006 - Validar Pesquisa de Cliente recém cadastrado e exibição dos dados em tela
Dado que o usuário está na página de pesquisa de clientes
E um cliente foi cadastrado recentemente
Quando o usuário pesquisa pelo cliente recém cadastrado
Então os dados do cliente são exibidos corretamente em tela

#CT007 - Editar Cliente através do botão na listagem de clientes
Dado que o usuário está na página de listagem de clientes
E existem clientes cadastrados
Quando o usuário clica no botão de editar para um cliente específico
E faz as alterações desejadas
E clica no botão de salvar
Então as alterações são salvas com sucesso

#C08 - Validar Cadastro de Clientes com Email inválido 
Dado que o usuário está na página de cadastro
Quando o usuário preenche o campo de Email com um formato inválido
E clica no botão de cadastrar
Entao uma mensagem de erro é exibida informando sobre o Email inválido


#C09 - Validar preenchimento de campos obrigatórios no cadastro de clientes
Dado que o usuário está na página de cadastro de clientes 
Quando o usuário tenta cadastrar sem preencher os campos obrigatórios
Então uma mensagem de erro é exibida informando sobre os campos obrigatórios não preenchidos

#C12 - Validar preenchimento "Informações do Candidato" ao clicar em "Finalizar e Enviar"
Dado que o usuário está na página de preenchimento de "Informações do Candidato"
Quando o usuário preenche todas as informações obrigatórias
E clica no botão "Finalizar e Enviar"
Então as informações do candidato são enviadas com sucesso