Given('eu estou na home do sistema') do
  visit'/'
end

Given('eu clico na opcao {string}') do |string|
  click_on string
end

When('eu coloco meu dados no formulario: nome completo {string}, cpf {string}, email {string} ,especilidade {string}, crm {string}') do |string, string2, string3, string4, string5|
  fill_in 'medico_nome_completo', with: string
  fill_in 'medico_cpf', with: string2
  fill_in 'medico_email', with: string3
  fill_in 'medico_especialidade', with: string4
  fill_in 'medico_crm', with: string5
end

When('eu clico na opcao  {string}') do |string|
  click_on string
end

Then('eu vejo o {string} do novo medico criado') do |string|
  expect(page).to have_content(string)
end



Given('procuro {string} na lista') do |string|
  #criando um novo medico para poder usar no teste
  visit '/medicos/new'
  fill_in 'medico_nome_completo', with: string
  fill_in 'medico_cpf', with: '11122234455'
  fill_in 'medico_email', with: 'william@gmail.com'
  fill_in 'medico_especialidade', with: 'pediatra'
  fill_in 'medico_crm', with: '223344'
  click_on 'Create Medico'
  #voltando ao fluxo normal do teste

  visit '/medicos'
  expect(page).to have_content(string)

end

Then('vejo as consultas que tem agendadas para mim') do
  expect(page).to have_content('Consultas Agendadas')
end
