class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :character_quote
      t.integer :tvcharacter_id

      t.timestamps null: false
    end
  end
end
