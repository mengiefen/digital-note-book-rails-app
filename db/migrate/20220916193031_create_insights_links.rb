class CreateInsightsLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :insights_links do |t|
      t.references :insight, null: false, foreign_key: true
      t.references :note, null: false, foreign_key: true

      t.timestamps
    end
  end
end
