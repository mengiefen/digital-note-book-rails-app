class CreateInsights < ActiveRecord::Migration[7.0]
  def change
    create_table :insights do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
