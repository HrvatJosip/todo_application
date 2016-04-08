class List < ActiveRecord::Base
	has_many :items, dependant: :destroy
	
	validates :title, presence: true, length: {maximum: 30}
	validates :description, length: {maximum: 150}
end
