json.results (@anime) do |anime|
  json.partial! '/api/anime/anime', anime: anime
end