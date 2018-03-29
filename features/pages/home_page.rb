class BaseHomePage

  def initialize(driver)
    @driver = driver
  end

  def signup_button
    @signup_button ||= @driver.id(@signup_button_id)
  end

  def click_to_login_button
    @signup_button.click
  end
end