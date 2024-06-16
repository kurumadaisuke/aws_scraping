require 'selenium-webdriver'
require_relative 'aws_calculator'
require_relative 'ec2'

driver = Selenium::WebDriver.for :chrome
driver.get 'https://calculator.aws'
driver.manage.window.maximize

wait = Selenium::WebDriver::Wait.new(timeout: 30)

aws_calculator = AWSCalculator.new(driver, wait)
aws_calculator.create_estimate_button_add
aws_calculator.resion_select_tokyo

ec2 = EC2.new(driver, wait)
ec2.configure_ec2_instance

driver.get 'https://calculator.aws/#/estimate'
save_element = wait.until { driver.find_element(:xpath, "/html/body/div[3]/div/div[2]/div/div/main/div/div[2]/div/div[1]/div/div[1]/div[2]/div/div/div[2]/button") }
save_element.click

loop do
  sleep(1)
end
