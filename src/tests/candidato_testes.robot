*** Settings ***
Resource    ../resource/candidato_resource.robot



*** Test Cases ***


CT012 - Validar preenchimento "Informações do Candidato"
    Dado que o usuário está na página de preenchimento Informações do Candidato
    Quando o usuário preenche todas as informações obrigatórias
    E clica no botão "Finalizar e Enviar"
    Então as informações do candidato são enviadas com sucesso