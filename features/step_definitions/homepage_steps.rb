Given(/^I land on home page$/) do
  @home_page = $ENV::HomePage.new($driver)

  assert_displayed(@home_page.signup_button)
end