When('eu coloco meu dados no formulario nome completo {string}, cpf {string}, email {string},data nascimento {string}, cep {string}, cidade {string}, bairro {string}, logradouro {string}, complemento {string}') do |string, string2, string3, string4, string5, string6, string7, string8, string9|
fill_in 'paciente_nome_completo', with: string
  fill_in 'paciente_cpf', with: string2
  fill_in 'paciente_email', with: string3
  fill_in 'paciente_data_nascimento', with: string4
  fill_in 'endereco_cep', with: string5
  fill_in 'endereco_cidade', with: string6
  fill_in 'endereco_bairro', with: string7
  fill_in 'endereco_logradouro', with: string8
  fill_in 'endereco_complemento', with: string9
end

Then('eu vejo o {string} o nome do novo paciente') do |string|
  expect(page).to have_content(string)
end

When('eu clico na opcao  no {string}') do |string|
  #Apenas para criar um paciente para que ele possa clicar
  visit '/pacientes/new'
  fill_in 'paciente_nome_completo', with: string
  fill_in 'paciente_cpf', with: '11122211133'
  fill_in 'paciente_email', with: 'william@gmail.com'
  fill_in 'paciente_data_nascimento', with: '2000/01/01'
  fill_in 'endereco_cep', with: '55380000'
  fill_in 'endereco_cidade', with: 'Cachoeirinha'
  fill_in 'endereco_bairro', with: 'Centro'
  fill_in 'endereco_logradouro', with: 'Rua vinte de maio'
  fill_in 'endereco_complemento', with: 'Casa verde'
  click_on 'Create Paciente'
  #voltando ao fluxo normal apos criar o paciente
  visit '/acessar_paciente'
  click_link string
end

Then('vejo as consultas que tenho agendado') do
  expect(page).to have_content('Consultas Agendadas')
end
