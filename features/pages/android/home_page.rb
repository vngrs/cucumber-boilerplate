require './features/pages/home_page'

module Android
  class HomePage < BaseHomePage

    def initialize(driver)
      @signup_button_id = 'signup'
      super(driver)
    end

  end
end
