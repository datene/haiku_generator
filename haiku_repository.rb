require_relative 'haiku'
require 'csv'

# CLASS REPO ACTS AS DATABASE
class HaikuRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @haikus = []
    read_from_csv
  end

  def all
    @haikus
  end

  def add(haiku)
    @haikus << haiku
    add_to_csv
  end

  def remove(index)
    @haikus.delete_at(index)
    add_to_csv
  end

  private

  def add_to_csv
    CSV.open(@csv_path, 'wb') do |csv|
      @haikus.each do |haiku|
        csv << [haiku.title, haiku.body[0], haiku.body[1]]
      end
    end
  end

  def read_from_csv
    CSV.foreach(@csv_path) do |row|
      body = []
      title = row[0]
      body << row[1]
      body << row[2]
      @haikus << Haiku.new(title, body)
    end
  end
end
