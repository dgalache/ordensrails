require 'spec_helper'

feature 'gerenciar ordem' do
	before(:each) do
		@cliente = create(:cliente, nome: "Arnaldo")
		@empregado = create(:empregado, nome: "Jose")
	end
	let(:dados) do {
		equipamento: "notebook",
		defeito: "tela quebrada",
		marca: "positivo",
		descricao: "apresenta faixa na tela",
		status: "em atendimento",
		valor: "200",
		cliente: "Arnaldo",
		empregado: "Jose",		
		}

	end
	scenario 'incluir ordem' do #, :js => true do
		visit new_ordem_path
		preencher(dados)
		click_button 'Salvar'
		verificar(dados)
	end
	scenario 'alterar ordem' do #, :js => true do
		ordem = FactoryGirl.create(:ordem, cliente: @nome, empregado: @nome)
		visit edit_ordem_path(ordem)
		preencher(dados)
		click_button 'Salvar'
		verificar(dados)
	end
	scenario 'excluir ordem' do #, :js => true do
		ordem = FactoryGirl.create(:ordem, cliente: @nome, empregado: @nome)
		visit ordems_path
		click_link('Excluir', match: :first)
	end
	def preencher(dados)
		fill_in 'Equipamento', with: dados[:equipamento]
		fill_in 'Defeito', with: dados[:defeito]
		fill_in 'Marca', with: dados[:marca]		
		fill_in 'Descricao', with: dados[:descricao]
		fill_in 'Status', with: dados[:status]		
		fill_in 'Valor', with: dados[:valor]
		select dados[:nome], from: "Cliente"
		select dados[:nome], from: "Empregado"
	end
	def verificar(dados)
		page.should have_content "Equipamento: #{dados[:equipamento]}"
		page.should have_content "Defeito: #{dados[:defeito]}"
		page.should have_content "Marca: #{dados[:marca]}"
		page.should have_content "Descricao: #{dados[:descricao]}"
		page.should have_content "Status: #{dados[:status]}"
		page.should have_content "Valor: #{dados[:valor]}"
		page.should have_content "Cliente: #{dados[:nome]}"
		page.should have_content "Empregado: #{dados[:nome]}"
	end
end