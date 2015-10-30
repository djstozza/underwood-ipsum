class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.integer :quote_id
      t.integer :tvcharacter_id
      t.integer :quotations
      t.integer :paragraph_number

      t.timestamps null: false
    end
  end
end
