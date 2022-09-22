class CreateLiteratures < ActiveRecord::Migration[7.0]
  def change
    create_table :literatures do |t|
      t.string :title
      t.text :literature

      t.timestamps
    end
  end
end
