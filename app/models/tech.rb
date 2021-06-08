class Tech < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :projects, through: :categories, dependent: :destroy

  validates :name, presence: true

end
