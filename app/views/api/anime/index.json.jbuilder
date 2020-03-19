json.count @count
json.next_page @next_page
json.prev_page @prev_page

json.results (@anime) do |anime|
  json.partial! '/api/anime/anime', anime: anime
end