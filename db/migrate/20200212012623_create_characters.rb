class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.integer :age
      t.string :gender
      t.float :height
      t.float :weight
      t.string :birthday
      t.string :eye_color
      t.string :hair_color
      t.string :voice_actor
      t.integer :anime_id, null: false 

      t.timestamps
    end

    add_index :characters, :anime_id
  end
end
