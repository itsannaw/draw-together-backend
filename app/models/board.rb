class Board < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
