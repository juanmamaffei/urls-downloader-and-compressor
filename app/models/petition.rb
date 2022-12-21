class Petition < ApplicationRecord
  has_many :subfiles
  enum status: { pending: 0, in_progress: 1, done: 2, error: 3 }
end
