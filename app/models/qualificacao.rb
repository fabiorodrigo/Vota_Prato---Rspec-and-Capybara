class Qualificacao < ActiveRecord::Base
  attr_accessible :cliente_id, :nota, :restaurante_id, :valor_gasto
	
  belongs_to :cliente
  belongs_to :restaurante
  
  has_many :comentarios, as: :comentavel
  validates :cliente, presence: true
  validates :restaurante, presence: true
  end
