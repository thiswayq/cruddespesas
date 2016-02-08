class Despesa < ActiveRecord::Base
	validates :description, :amount, :comment, presence: true 
end
