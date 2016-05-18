# APP INITIALIZES ROUTER WITH NECESSARY ELEMENTS
require_relative 'haiku_repository'
require_relative 'controller'
require_relative 'router'

CSV_FILE = File.join(File.dirname(__FILE__), 'haikus.csv')
haiku_repository = HaikuRepository.new(CSV_FILE)

controller = Controller.new(haiku_repository)

router = Router.new(controller)

router.run