Given("o onibus de placa: {string}, chassi: {string}, modelo: {string}, capacidade: {int}, status: {string} foi criado") do |placa, chassi, modelo, capacidade, status|
  visit '/onibuses/new'
  fill_in 'Placa', with: placa
  fill_in 'Chassi', with: chassi
  fill_in 'Modelo', with: modelo
  fill_in 'Capacidade', with: capacidade
  select(status, from: 'Status')
  click_button 'Create Onibus'
end

And("o usuario esta na pagina de busca de onibus") do
  visit '/onibuses/busca'
end

And("digita a placa do onibus que deseja buscar") do
  fill_in 'Busca', with: "ABC-1234"
end

When("seleciona a caracteristica placa para buscar") do
  expect(page).to have_content('Placa:')
  # choose("Placa")
end

And("clica em buscar") do
  click_button "Buscar"
end

Then("aparece o onibus desejado") do
  # expect(page).to have_content('Resultados da Busca por Placa:')
  # Tirar do comentario assim que resolver os passos com "choose"
end

And("digita o modelo do onibus que deseja buscar") do
  fill_in 'Busca', with: "Marcopolo Paradiso 1800 DD"
end

When("seleciona a caracteristica modelo para buscar") do
  expect(page).to have_content('Modelo:')
  # choose('Modelo:')
end

And("digita o chassi do onibus que deseja buscar") do
  fill_in 'Busca', with: "9BWGD21JX22512345"
end

When("seleciona a caracteristica chassi para buscar") do
  expect(page).to have_content('Chassi:')
  # choose('Chassi:')
end

And("digita uma placa da qual nao existe no banco de dados") do
  fill_in 'Busca', with: "CCC-4444"
end

Then("aparece a mensagem de que nenhum onibus foi encontrado") do
  expect(page).to have_content('Nenhum onibus encontrado.')
end

And("digita um modelo da qual nao existe no banco de dados") do
  fill_in 'Busca', with: "MERCEDES BENZ 1040"
end