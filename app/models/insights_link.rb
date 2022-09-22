class InsightsLink < ApplicationRecord
  # The target, the one that is linked to the source(note)
  belongs_to :insight
  # Source insight record that links to the target insight record
  belongs_to :note, class_name: 'Insight'
  validates :insight_id, presence: true
  validates :insight_id, uniqueness: { scope: :note_id }
  validates :note_id, presence: true
end
