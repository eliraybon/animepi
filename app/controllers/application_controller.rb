class ApplicationController < ActionController::Base
  SMALL_WORDS = Set.new(%w(and of x))
  IGNORE = Set.new(%w(page format controller action))
  STRING_PARAMS = Set.new(%w(title genre name gender eye_color hair_color voice_actor))
  NUM_PARAMS = Set.new(%w(year episodes age height weight birthday))

  def build_search_query(params)
    search_query = []
    values = []
    
    params.each do |key, val|
      if !IGNORE.include?(key)
        if STRING_PARAMS.include?(key)
          search_query << "LOWER(#{key}) LIKE ?"
          values << "%#{val.downcase}%"
        elsif NUM_PARAMS.include?(key)
          search_query << "#{key} = ?"
          values << val
        elsif key == "anime"
          anime_ids = Anime.where("LOWER(title) LIKE ?", "%#{val.downcase}%").pluck(:id)
          search_query << "anime_id IN (#{anime_ids.join(', ')})"
        end
      end
    end

    search_query = search_query.join('AND ')

    {
      search_query: search_query, 
      values: values 
    }
  end

  # def titleize(title)
  #   words = title.split('_')

  #   #handles case if you search for 'x' and want to see HxH
  #   if words.length == 1 && SMALL_WORDS.include?(words.first)
  #     return words.first
  #   end

  #   words.map.with_index do |word, i|
  #     if !i.zero? && SMALL_WORDS.include?(word)
  #       word.downcase
  #     else
  #       word.capitalize
  #     end
  #   end.join(' ')
  # end
end
