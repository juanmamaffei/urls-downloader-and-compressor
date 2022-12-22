class Subfile < ApplicationRecord
  belongs_to :petition
  enum status: { pending: 0, downloaded: 1, processed: 2, error: 3 }
end
