class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.string :content
      t.integer :quote_id

      t.timestamps null: false
    end
  end
end
