#require 'simplecov'
#SimpleCov.start do
#  add_group "Models", "app/models"
#  add_group "Controllers", "app/controllers"
#  add_group "Long files" do |src_file|
#    src_file.lines.count > 100
#  end
#  add_group "Multiple Files", ["app/models", "app/controllers"] # You can also pass in an array
#end

RSpec.configure do |config|
  config.backtrace_exclusion_patterns << /\.bundle/

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end
end
