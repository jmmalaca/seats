# frozen_string_literal: true

RSpec.configure do |_config|
  # This block takes a snapshot of the page you are testing.
  # See capybara docs for more on this.
  # The snapshots are saved by default in tmp/capybara.
  # config.after do |example|
  #     if example.metadata[:type] == :feature
  #     # save_and_open_page
  #     save_and_open_screenshot
  #     end
  # end

  # This block must be here, do not combine with
  # the other `before(:each)` block.
  # This makes it so Capybara can see the database.
  # config.before(:each) do
  #     DatabaseCleaner.start
  # ends

  # This block makes sure that tests start on a clean slate
  # config.before(:suite) do
  #     DatabaseCleaner.clean_with(:truncation)
  # end

  # This block configures Caypbara's driver to use Selenium
  # It makes it use the chrome browser, but can also be
  # configured to user Firefox, etc.
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end

  # Uncomment to use capybara-webkit driver for headless testing
  # If you want to use Capybara.javascript_driver = :webkit
  # you will have to gem install capybara-webkit .
  # Capybara.javascript_driver = :webkit
  # Capybara.run_server = false
  # Capybara.app_host = "https://my-website.mysite.com"
  Capybara.configure do |cap_config|
    cap_config.default_max_wait_time = 10 # seconds
    cap_config.default_driver = :selenium
    # cap_config.always_include_port = true
  end
end
