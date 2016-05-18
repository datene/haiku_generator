# CLASS WIKI CONTAINS TITLE AND DESCRIPTION
class Haiku
  attr_reader :title, :body
  
  def initialize(title, body)
    @title = title
    @body = body
  end
end
