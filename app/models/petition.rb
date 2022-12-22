class Petition < ApplicationRecord
  has_many :subfiles
  has_one_attached :zip_file
  enum status: { pending: 0, in_progress: 1, done: 2, error: 3 }
end
