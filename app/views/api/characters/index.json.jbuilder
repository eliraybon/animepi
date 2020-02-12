json.results (@characters) do |character|
  json.partial! '/api/characters/character', character: character
end