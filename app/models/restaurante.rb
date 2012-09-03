#encoding:iso-8859-1
class Restaurante < ActiveRecord::Base
   attr_accessible :nome, :endereco, :especialidade 
   
   validates_presence_of :nome, message: "deve ser preenchido"
   validates_presence_of :endereco, message: "deve ser preenchido"
   validates_presence_of :especialidade, message: "deve ser preenchido"
	
   validates_uniqueness_of :nome, message: "nome j� cadastrado"
   validates_uniqueness_of :endereco, message: "endere�o j� cadastrado"
  
   validate :primeira_letra_deve_ser_maiuscula
	
   has_many :qualificacoes
   has_and_belongs_to_many :pratos
   has_many :comentarios, as: :comentavel

private
  def primeira_letra_deve_ser_maiuscula
    errors.add(:nome, "primeira letra deve ser mai�scula") unless nome =~ /[A-Z].*/
  end
  
  scope :massas, where(especialidade: 'massas')
  scope :recentes, where(["created_at > ?", 3.months.ago])
  scope :pelo_nome, order('nome')
  
end
