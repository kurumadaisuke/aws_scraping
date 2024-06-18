require 'selenium-webdriver'

class NatGateway
  def initialize(driver, wait)
    @driver = driver
    @wait = wait
  end

  def configure_nat_gateway
    @driver.get 'https://calculator.aws/#/createCalculator/VPC'
    sleep(2)
    checkboxes = @wait.until { @driver.find_elements(:xpath, "//input[@class='awsui_native-input_1wepg_1bo9u_116']") }
    @driver.execute_script("arguments[0].click();", checkboxes[0])
    @driver.execute_script("arguments[0].click();", checkboxes[1])

    input_element = @wait.until { @driver.find_element(:xpath, "//input[@aria-label='Number of NAT Gateways Enter the amount']") }
    @driver.execute_script("arguments[0].scrollIntoView(true);", input_element)
    input_element.clear
    input_element.send_keys("2")

    input_element = @wait.until { @driver.find_element(:xpath, "//input[@aria-label='Data Processed per NAT Gateway Value']") }
    @driver.execute_script("arguments[0].scrollIntoView(true);", input_element)
    input_element.clear
    input_element.send_keys("100")

    save_element = @wait.until { @driver.find_element(:xpath, "/html/body/div[3]/div/div[3]/div/div[2]/div/div[3]/div/div/div/div[3]/div/button") }
    save_element.click
  end
end
