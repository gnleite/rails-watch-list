class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  has_one_attached :photo

  validates :movie_id, presence: true, uniqueness: { scope: :list_id }
  validates :comment, length: { minimum: 6 }
end
