class AddDetailsToAnime < ActiveRecord::Migration[5.2]
  def change
    add_column :anime, :studio, :string
    add_column :anime, :image_url, :string

    add_index :anime, :title
  end
end
