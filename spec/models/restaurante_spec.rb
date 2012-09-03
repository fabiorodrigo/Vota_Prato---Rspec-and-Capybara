# spec/models/restaurante.rb
require 'spec_helper'

describe "Restaurantes" do
  describe "Manage restaurantes" do
    it "Adds a new restaurante and displays the results" do
	  visit "/restaurantes"
	  expect{
	    click_link 'Novo Restaurante'
		fill_in 'Nome', with: "Delirio Tropical"
		fill_in 'Endereco', with: "Av. Marques de Sao Vicente, 255 - Gavea"
		fill_in 'Especialidade', with: "Salada"
		click_button "Criar"
	  }.to change(Restaurante,:count).by(1)
	  page.should have_content "Delirio"
	  page.should have_content "Av. Marques de Sao Vicente, 255 - Gavea"
	  page.should have_content "Salada"	 
    end  
   end
   
  it "has a new restaurante" do
	FactoryGirl.create(:restaurante).should be_valid
  end  
	
  it "should have a name" do
	 FactoryGirl.build(:restaurante, nome: nil).should_not be_valid
  end  
	
  it "should have a adress" do
	FactoryGirl.build(:restaurante, endereco: nil).should_not be_valid
  end  
	
  it "shoud have a speciality " do
	FactoryGirl.build(:restaurante, especialidade: nil).should_not be_valid
  end  
	
  it "is invalid when a name starts with a letra minuscula" do
	FactoryGirl.build(:restaurante, nome: 'norte grill').should_not be_valid
  end 		
end	