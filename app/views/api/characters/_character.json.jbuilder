json.extract! character, :name
json.age character.age || "Unknown"
json.extract! character, :gender, :height, :weight, :birthday, :eye_color, :hair_color
json.anime character.anime.title