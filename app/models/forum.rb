class Forum < ApplicationRecord
  belongs_to :collection
  has_many :users
  has_many :sources, through: :users

  validates :collection, presence: true
end
