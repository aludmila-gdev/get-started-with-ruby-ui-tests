######### DADO #########
Dado(/^que eu esteja na home do Internet$/) do
  visit 'http://the-internet.herokuapp.com/'
end

######### QUANDO #########
Quando(/^entro na pagina do dropdown e escolho a "([^"]*)"$/) do |opcao|
  click_link('Dropdown')
end
