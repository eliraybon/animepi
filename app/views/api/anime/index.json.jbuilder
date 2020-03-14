json.results (@anime) do |anime|
  json.partial! '/api/anime/anime', anime: anime, is_admin: @is_admin
end