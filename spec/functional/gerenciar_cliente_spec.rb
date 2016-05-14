require 'spec_helper'

	feature 'gerencia cliente' do
		scenario 'incluir cliente' do # , :js => true do
			visit new_cliente_path
			preencher_e_verficar_cliente
		end

		scenario 'alterar cliente' do # , :js => true do
			cliente = FactoryGirl.create(:cliente)
			visit edit_cliente_path(cliente)
			preencher_e_verficar_cliente
		end

		scenario 'excluir cliente' do #, :javascript => true do
			cliente = FactoryGirl.create(:cliente)
			visit clientes_path
		
			click_link('Excluir', match: :first)
		end
		def preencher_e_verficar_cliente
			fill_in 'Nome', :with => "Joao Junio"
			fill_in 'Telefone', :with => "998567885"
			fill_in 'Endereco', :with => "Rua D"
			fill_in 'Cpf', :with => "133.456.543-34"
			fill_in 'Satisfacao', :with => "Bom servico"			
			
			click_button 'Salvar'

			expect(page).to have_content 'Nome: Joao Junio'
			expect(page).to have_content 'Telefone: 998567885'
			expect(page).to have_content 'Endereco: Rua D'
			expect(page).to have_content 'Cpf: 133.456.543-34'
			expect(page).to have_content 'Satisfacao: Bom servico'
			
		end
end