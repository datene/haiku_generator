require_relative 'view'
require_relative 'haiku'
require_relative 'api'

# CLASS CONTROLLER COMMUNICATES WITH REPOSITORY AND VIEW
class Controller
  def initialize(haiku_repository)
    @haiku_repository = haiku_repository
    @view = View.new
    @api = Api.new
  end

  def index
    haikus = @haiku_repository.all
    @view.display_haikus(haikus)
  end


  def destroy
    @view.display_haikus(@haiku_repository.all)
    @haiku_repository.remove(@view.remove_haiku)
  end

  def api_haiku_create
    result = api_call
    title = title_generator(result[0])
    body = [result[0], result[1]]
    return false if @view.display_result(title, body) == false
    haiku = Haiku.new(title, body)
    @haiku_repository.add(haiku)
  end

  private

  def api_call
    api_result = []
    collection = search_terms
    collection.each do |search_term|
      api_result << @api.searcher(search_term)
    end
    api_result
  end

  def title_generator(input)
    unwanted_words = %w(the, it, what, if, and, is)
    filtered_words = input.gsub(/\W/, " ")
    words = filtered_words.split(' ')
    title = words.sample
    if unwanted_words.include?(title)
      title_generator(words)
    else
      title
    end
  end

  def search_terms
    result = []
    key_words = @view.search
    key_words.each do |search_term|
      array = search_term.split(' ')
      if array.count > 1
        array.join('%20')
      end
      result << array
    end
    result
  end
end
