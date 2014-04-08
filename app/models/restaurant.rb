class Restaurant < ActiveRecord::Base
	validates :id_number, :name, presence: true
	has_many :dishes, dependent: :destroy
end
