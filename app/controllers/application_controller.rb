class ApplicationController < ActionController::Base
  SMALL_WORDS = Set.new(%w(and of x))
  IGNORE = Set.new(%w(page format controller action))
  STRING_PARAMS = Set.new(%w(title genre name gender eye_color hair_color voice_actor))
  NUM_PARAMS = Set.new(%w(year episodes age height weight birthday))

  def build_search_query(params)
    search_query = []
    values = []
    order = ""
    
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
        elsif key == "order"
          desc = params.has_key?(:desc) ? "DESC" : ""
          order << "#{params[:order]} #{desc}"
        end
      end
    end

    search_query = search_query.join('AND ')

    {
      search_query: search_query, 
      values: values,
      order: order 
    }
  end
end
