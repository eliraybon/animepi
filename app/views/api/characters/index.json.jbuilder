if @page
  if @page + 1 <= @max_page
    json.next "http://localhost:3000/api/characters/?page=#{@page + 1}"
  else 
    json.next nil
  end
  
  if @page - 1 > 0
    json.prev "http://localhost:3000/api/characters/?page=#{@page - 1}"
  else
    json.prev nil
  end
else
  json.anime @anime.title
end

json.results (@characters) do |character|
  json.partial! '/api/characters/character', character: character
end