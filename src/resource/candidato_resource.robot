*** Settings ***
Library           Browser

*** Variables ***

${email}                testep@tmail.com
${senha}                123456
${telefone}             11999999999   
${url}                  https://challenge.primecontrol.com.br
${nome}                 Teste
${nome_candidato}       Vinicius Marcelo Rifam Laurindo
${telefone_candidato}   49 985046158
${email_candidato}      vinicius.rifam@gmail.com
${github}               https://github.com/rifam   
${nomeRecrutador}       Livia  Serafim


*** Keywords ***

#C12 - Validar preenchimento "Informações do Candidato" ao clicar em "Finalizar e Enviar"
Dado que o usuário está na página de preenchimento Informações do Candidato
    New Browser    browser=chromium        headless=False
    New Page       ${url}/app
    
    Wait For Elements State   form h1    visible    5000
    Get Text                  form h1    equals    Login    
    Fill Text                 css=input[type="email"]                  ${email}  
    Fill Text                 css=input[type="password"]               ${senha} 
    Click                     css=button[type="button"]  
    Wait For Elements State   div h1    visible    10000 

    Click                     xpath=/html/body/div/div/nav/div/div/ul/li/a

    Wait For Elements State   div h6   visible    10000 
    Get Text                  div h6    equals    Para submeter os dados do projeto, clique em 'Enviar'. Se desejar sair, clique em 'Logout'.

    Click                    xpath=//*[@id="root"]/div/nav/div[2]/div/div/div/button[2]

    Wait For Elements State   div h3   visible    10000 
    Get Text                  div h3    equals    Informações do Candidato

Quando o usuário preenche todas as informações obrigatórias
    Fill Text                 css=input[id="nome"]                  ${nome_candidato}
    Fill Text                 css=input[id="telefone"]              ${telefone_candidato}
    Fill Text                 css=input[id="email"]                 ${email_candidato}
    Fill Text                 css=input[id="githubLink"]            ${github}
    Fill Text                 css=input[id="nomeRecrutador"]        ${nomeRecrutador}
    Sleep                     5s

Então clica no botão "Finalizar e Enviar"
    Click                     xpath=//*[@id="root"]/div/nav/div[2]/div/form/div[6]/button
    

