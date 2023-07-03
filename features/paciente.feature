Feature: paciente
  As a um paciente
  I want to poder criar meu cadastro no sistema e suas consultas
  So that eu possa me registrar e consultar as consultas que tenho agendado

  Scenario: paciente se cadastra
    Given eu estou na home do sistema
    And eu clico na opcao "Novo Paciente"
    When eu coloco meu dados no formulario nome completo "William Batista", cpf "11122233344", email "william@gmail.com",data nascimento "2000/01/01", cep "55380000", cidade "Jupi", bairro "centro", logradouro "rua vinte de maio", complemento "casa azul"
    And eu clico na opcao  "Create Paciente"
    Then eu vejo o "William Batista" o nome do novo paciente

  Scenario: paciente ve suas consultas agendadas
    Given eu estou na home do sistema
    And eu clico na opcao "Acessar"
    And procuro "William Batista" na lista
    When eu clico na opcao  no "William Batista"
    Then vejo as consultas que tenho agendado


