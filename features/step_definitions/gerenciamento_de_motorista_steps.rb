Given('eu que sou um usuario do sistema') do
  visit "motorista"
  expect(page).to have_content("Motorista")
end

When('eu acesso a pagina de registro do motorista') do
  visit "motorista/new"
  expect(page).to have_content("New motoristum")
end

And('preencho {string} com {string}') do |campo, valor|
  fill_in "motoristum[#{campo}]", with: valor
end

When('clico no botao para cadastrar o motorista') do
  click_button "Create Motoristum"
end

Given('existe um motorista registrado com cpf {string}') do |cpf|
  visit '/motorista/new'
  fill_in 'Nome', with: 'Henrique Almeida'
  fill_in 'Cpf', with: cpf
  fill_in 'Email', with: 'almeida@gmail.com'
  fill_in 'Senha', with: '12345@'
  fill_in 'Telefone', with: '11123456789'
  fill_in 'Cnh', with: '0123456789'
  click_button 'Create Motoristum'
end

Given('eu estou na pagina de listagem de motorista') do
  visit 'motorista'
end

When('eu acesso um motorista em especifico') do
  click_on 'Show this motoristum'
end

When('eu clico para excluir o motorista') do
  click_button 'Destroy this motoristum'
end

When('eu clico para editar motorista') do
  click_on 'Edit this motoristum'
end

When('clico para atualizar o motorista') do
  click_button 'Update Motoristum'
end

Then('aparece a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

Then('eu vejo os detalhes do motorista com o cpf: {string} e vejo os campos do mesmo') do |cpf|
  expect(page).to have_content("Nome: Henrique Almeida")
  expect(page).to have_content("Cpf: #{cpf}")
  expect(page).to have_content("Email: almeida@gmail.com")
  expect(page).to have_content("Telefone: 11123456789")
  expect(page).to have_content("Cnh: 0123456789")
end