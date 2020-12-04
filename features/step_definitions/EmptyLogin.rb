require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

browser = Selenium::WebDriver.for:firefox

Given("open login page") do
  url = "https://partner-02.st.revoup.ru"
  browser.navigate.to url                  # go to site
end

When("login and password is empty") do
  @login = browser.find_element(xpath: "//input[@id='mobile_phone']").attribute("value")
  log(@login.empty?)
  @pass = browser.find_element(xpath: "//input[@id='password']").attribute("value")
  log(@pass.empty?)
end

Then("click button 'ENTER'") do
    browser.find_element(:css,'[type="submit"]').click if @login.empty? && @pass.empty?   # click click submit
    sleep(3)                                                                              # pause
end

Then("validate result {string}") do |string|
  response = browser.find_element(xpath: "//div[@Class='formBlock']").text
  log(response)
  expect(response).to include('Неправильный логин или пароль')
end