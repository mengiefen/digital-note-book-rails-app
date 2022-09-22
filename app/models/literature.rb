class Literature < ApplicationRecord
  validates :title, presence: true
  validates :literature, presence: true
end
