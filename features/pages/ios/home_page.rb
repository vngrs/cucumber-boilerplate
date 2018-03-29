require './features/pages/home_page'

module IOS
  class HomePage < BaseHomePage

    def initialize(driver)
      @signup_button_id = 'ios_signup'
      super(driver)
    end

  end
end