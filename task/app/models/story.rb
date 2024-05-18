class Story < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :title, :body, presence: true
end
