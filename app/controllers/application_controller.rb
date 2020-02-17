class ApplicationController < ActionController::Base
  SMALL_WORDS = Set.new(%w(and of x))

  def titleize(title)
    words = title.split('_')

    #handles case if you search for 'x' and want to see HxH
    if words.length == 1 && SMALL_WORDS.include?(words.first)
      return words.first
    end

    words.map.with_index do |word, i|
      if !i.zero? && SMALL_WORDS.include?(word)
        word.downcase
      else
        word.capitalize
      end
    end.join(' ')
  end
end
