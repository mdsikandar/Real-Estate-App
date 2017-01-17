class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 3 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects
  has_many :properties
end
