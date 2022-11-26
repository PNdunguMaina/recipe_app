class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes, foreign_key: :user_id
  has_many :inventories, dependent: :destroy
  has_many :inventory_foods, through: :inventories
  has_many :recipe_foods, through: :recipes
  has_many :foods, dependent: :destroy
  validates :name, presence: true
end
