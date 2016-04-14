class List < ActiveRecord::Base
	has_many :items, dependent: :destroy
	belongs_to :user
	
	validates :title, presence: true, length: {maximum: 30}
	validates :description, length: {maximum: 150}
end
