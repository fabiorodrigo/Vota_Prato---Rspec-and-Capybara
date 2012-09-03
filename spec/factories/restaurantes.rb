# spec/factories/restaurantes.rb

FactoryGirl.define do
  factory :restaurante do |f|
    f.nome "Planetario"
    f.endereco "Av. Lucio Costa"
	f.especialidade "Gororoba"
  end
  
  factory :invalid_restaurante, parent: :restaurante do |f|
    f.nome nil
  end	
end  