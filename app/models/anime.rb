class Anime < ApplicationRecord
  self.table_name = "anime"

  has_many :characters
end