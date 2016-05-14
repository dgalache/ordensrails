require 'spec_helper'

feature 'gerenciar empregado' do
	before(:each) do
		@cargo = create(:cargo, tipo: "redes")
	end
	let(:dados) do {
		nome: "Maria",
		telefone: "998543432",
		endereco: "Rua das Couves",
		dataadm: "21-02-2013",
		cpf: "133.444.352-34",
		rg: "23.234.322-56",
		cargo: "redes",		
		}

	end
	scenario 'incluir empregado' do #, :js => true do
		visit new_empregado_path
		preencher(dados)
		click_button 'Salvar'
		#save_and_open_page
		verificar(dados)
	end
	scenario 'alterar empregado' do #, :js => true do
		empregado = FactoryGirl.create(:empregado, cargo: @tipo)
		visit edit_empregado_path(empregado)
		preencher(dados)
		#save_and_open_page
		click_button 'Salvar'
		#save_and_open_page
		verificar(dados)
	end
	scenario 'excluir empregado' do #, :js => true do
		empregado = FactoryGirl.create(:empregado, cargo: @tipo)
		visit empregados_path
		#save_and_open_page
		#click_link 'Excluir'
		click_link('Excluir', match: :first)
	end
	def preencher(dados)
		fill_in 'Nome', with: dados[:nome]
		fill_in 'Telefone', with: dados[:telefone]
		fill_in 'Endereco', with: dados[:endereco]		
		fill_in 'Dataadm', with: dados[:dataadm]
		fill_in 'Cpf', with: dados[:cpf]		
		fill_in 'Rg', with: dados[:rg]
		select dados[:tipo], from: "Cargo"
	end
	def verificar(dados)
		page.should have_content "Nome: #{dados[:nome]}"
		page.should have_content "Telefone: #{dados[:telefone]}"
		page.should have_content "Endereco: #{dados[:endereco]}"
		page.should have_content "Dataadm: #{dados[:dataadm]}"
		page.should have_content "Cpf: #{dados[:cpf]}"
		page.should have_content "Rg: #{dados[:rg]}"
		page.should have_content "Cargo: #{dados[:tipo]}"
	end
end