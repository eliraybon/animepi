json.extract! anime, :id, :title, :genre, :year, :episodes, :studio, :description
json.image_url anime.image_url if is_admin
