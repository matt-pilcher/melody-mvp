class CreatePhrases < ActiveRecord::Migration[7.0]
  def change
    create_table :phrases do |t|
      t.text :sentence
      t.text :translation
      t.integer :level
      t.references :song, null: false, foreign_key: true

      t.timestamps
    end
  end
end
