class Property < ApplicationRecord
	validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
	has_many :projects, dependent: :destroy
	belongs_to :user
end
