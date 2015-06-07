require 'pry'

class CustomFormatter
  # This registers the notifications this formatter supports, and tells
  # us that this was written against the RSpec 3.x formatter API.
  RSpec::Core::Formatters.register self,
    :example_started,
    :example_group_started


  def format
    "-r 200 -v Bruce"
  end

  def initialize(output)
    @output = output
  end

  def example_group_started(notification)
    `say "#{notification.group.description}" #{format}`
    sleep 0.3
  end

  def example_started(notification)
    `say "#{notification.example.description}" #{format}`
    sleep 0.3
  end
end
