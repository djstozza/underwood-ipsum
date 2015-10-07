class CreateTvcharacters < ActiveRecord::Migration
  def change
    create_table :tvcharacters do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
