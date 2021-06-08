class Category < ApplicationRecord
  belongs_to :tech
  has_many :projects, dependent: :destroy

  validates :name, presence: true
  validates :tech, presence: true
end
