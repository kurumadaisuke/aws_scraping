require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.get 'https://calculator.aws'
driver.manage.window.maximize

wait = Selenium::WebDriver::Wait.new(timeout: 30)
span_element = wait.until { driver.find_element(:xpath, "//span[text()='Create estimate']") }
span_element.find_element(:xpath, "./ancestor::button").click

button_element = wait.until { driver.find_element(:xpath, "//button[@aria-haspopup='dialog']") }
button_element.click

input_element = wait.until { driver.find_element(:xpath, "//input[@class='awsui_input_2rhyz_clr0q_103 awsui_input-has-icon-left_2rhyz_clr0q_231 awsui_input-has-no-border-radius_2rhyz_clr0q_268']") }
input_element.clear
input_element.send_keys("Asia Pacific (Tokyo)")

input_element.send_keys(:arrow_down)
input_element.send_keys(:enter)

3.times do
  driver.get 'https://calculator.aws/#/createCalculator/ec2-enhancement'
  sleep(3)
  input_element = wait.until { driver.find_element(:xpath, "//input[@class='awsui_input_2rhyz_clr0q_103 awsui_input-type-search_2rhyz_clr0q_252 awsui_input-has-icon-left_2rhyz_clr0q_231']") }
  input_element.clear
  input_element.send_keys("m5.large")
  sleep(3)
  radio_element = wait.until { driver.find_element(:xpath, '/html/body/div[3]/div/div[2]/div/div/main/div/div[2]/div/div[1]/div/div/div/div/div/div[1]/div[2]/div[2]/div/div/div/div[1]/div/div/span[1]/div/div/div/div[2]/div/div/div/div/div/div[6]/div/div/div/div[2]/div[1]/table/tbody/tr/td[1]/span/label/span/span/span[1]/input') }
  radio_element.click

  ondemand_element = wait.until { driver.find_element(:id, "on-demand") }
  ondemand_element.click

  save_element = wait.until { driver.find_element(:xpath, "/html/body/div[3]/div/div[3]/div/div[2]/div/div[3]/div/div/div/div[3]/div/button") }
  save_element.click
end

driver.get 'https://calculator.aws/#/estimate'
save_element = wait.until { driver.find_element(:xpath, "/html/body/div[3]/div/div[2]/div/div/main/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div/div[2]/button") }
save_element.click

loop do
  sleep(1)
end
