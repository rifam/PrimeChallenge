*** Test Cases ***
CT011 - Recuperar senha de acesso
    Dado que o usuário está na página de recuperação de senha
    Quando o usuário insere seu Email válido e solicita a recuperação
    Então uma mensagem de sucesso é exibida informando sobre o processo de recuperação

CT012 - Validar preenchimento "Informações do Candidato" ao clicar em "Finalizar e Enviar"
    Dado que o usuário está na página de preenchimento de "Informações do Candidato"
    Quando o usuário preenche todas as informações obrigatórias
    E clica no botão "Finalizar e Enviar"
    Então as informações do candidato são enviadas com sucesso
