# frozen_string_literal: true

require "capybara/rspec"

timeout = 20

Capybara.default_max_wait_time = timeout

Capybara.javascript_driver =
  ENV.fetch("JS_DRIVER", "selenium_chrome_headless").to_sym
Capybara.always_include_port = true

Capybara.server = :puma
Capybara.server_host = ENV["CAPYBARA_HOST"] || "127.0.0.1"
Capybara.reuse_server = true

Capybara.app_host = ENV["CAPYBARA_URL"]

case Capybara.javascript_driver
when :headless_chrome
  Capybara.register_driver :headless_chrome do |app|
    capabilities =
      Selenium::WebDriver::Remote::Capabilities.chrome(
        'goog:chromeOptions': {
          args: %w[
            no-sandbox
            window-size=1680,3000
            blink-settings=imagesEnabled=false
            bwsi
            disable-gpu
            no-first-run
            disable-default-apps
            headless
          ],
          w3c: false
        }
      )
    driver_options = {
      browser: :chrome,
      clear_local_storage: true,
      desired_capabilities: capabilities
    }
    if ENV["SELENIUM_URL"]
      driver_options[:url] = ENV["SELENIUM_URL"]
    end
    Capybara::Selenium::Driver.new(app, driver_options)
  end
when :chrome
  Capybara.register_driver :chrome do |app|
    capabilities =
      Selenium::WebDriver::Remote::Capabilities.chrome(
        'goog:chromeOptions': {args: %w[window-size=1680,1050], w3c: false}
      )
    driver_options = {
      browser: :chrome,
      clear_local_storage: true,
      desired_capabilities: capabilities
    }
    if ENV["SELENIUM_URL"]
      driver_options[:url] = ENV["SELENIUM_URL"]
    end
    Capybara::Selenium::Driver.new(app, driver_options)
  end
end
