class Review < ApplicationRecord
  belongs_to :user
  belongs_to :story
  validates :comment, :rating, presence: true
  validates :rating, inclusion: { in: 1..5 }
end
