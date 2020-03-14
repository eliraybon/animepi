class ApplicationController < ActionController::Base
  STRING_PARAMS = Set.new(%w(title genre studio description))
  NUM_PARAMS = Set.new(%w(year episodes))
  IGNORE = Set.new(%w(page format controller action))

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

  def admin?
    request.headers[:token] == Rails.application.credentials.admin_token
  end
end
