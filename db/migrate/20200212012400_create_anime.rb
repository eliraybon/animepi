class CreateAnime < ActiveRecord::Migration[5.2]
  def change
    create_table :anime do |t|
      t.string :title, null: false, 
      t.text :description
      t.integer :year
      t.string :genre
      t.integer :episodes 

      t.timestamps
    end
  end
end
