require 'pry'
require 'push_notifier'
RSpec.configure do |config|

#add this line inside the block
  config.expose_current_running_example_as :example

end