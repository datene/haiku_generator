require 'open-uri'
require 'json'

class Api
  def searcher(tag)
    api_url = "https://glosbe.com/gapi/tm?from=eng&dest=eng&format=json&phrase=#{tag}&page=1&pretty=true"
    result = []

    open(api_url) do |stream|
      quote_collection = JSON.parse(stream.read)
      check_result(random_quote(quote_collection))
    end
  end

  private

  def check_result(result)
    result.nil? ? "No such thing" : result['first']
  end

  def random_quote(quote_collection)
    random_sample = quote_collection['examples'].sample
    if random_sample['first'].include?("•")
      random_quote(quote_collection)
    elsif random_sample['first'].split(" ").count > 10 
      random_quote(quote_collection)
    else
      random_sample
    end
  end
end

