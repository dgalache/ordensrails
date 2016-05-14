require 'spec_helper'

	feature 'gerencia empregador' do
		scenario 'incluir empregador' do # , :js => true do
			visit new_empregador_path
			preencher_e_verficar_empregador
		end
		scenario 'alterar empregador' do # , :js => true do
			empregador = FactoryGirl.create(:empregador)
			visit edit_empregador_path(empregador)
			preencher_e_verficar_empregador
		end
		scenario 'excluir empregador' do #, :javascript => true do
			empregador = FactoryGirl.create(:empregador)
			visit empregadors_path
		
			click_link('Excluir', match: :first)
		end
		def preencher_e_verficar_empregador
			fill_in 'Nome', :with => "Joao Junio"
			fill_in 'Telefone', :with => "998574567"
			fill_in 'Endereco', :with => "Rua Vai"
			fill_in 'Cnpj', :with => "XX.XXX.XXX/YYYY-ZZ"
			
			click_button 'Salvar'
			expect(page).to have_content 'Nome: Joao Junio'
			expect(page).to have_content 'Telefone: 998574567'
			expect(page).to have_content 'Endereco: Rua Vai'
			expect(page).to have_content 'Cnpj: XX.XXX.XXX/YYYY-ZZ'
			
		end
end