class List < ActiveRecord::Base
	validates :title, presence: true, length: {maximum: 30}
	validates :description, length: {maximum: 150}
end
