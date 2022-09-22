class Insight < ApplicationRecord
  validates :text, presence: true

  has_many :insights_links, foreign_key: :note_id, class_name: 'InsightsLink'
  has_many :insights, through: :insights_links
  # Self referencing association for insights
end
