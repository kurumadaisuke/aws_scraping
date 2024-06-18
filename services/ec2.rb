require 'selenium-webdriver'

class EC2
  def initialize(driver, wait)
    @driver = driver
    @wait = wait
  end

  def configure_ec2_instance
    @driver.get 'https://calculator.aws/#/createCalculator/ec2-enhancement'
    sleep(2)

    instance_type = @wait.until { @driver.find_element(:xpath, "//input[@class='awsui_input_2rhyz_clr0q_103 awsui_input-type-search_2rhyz_clr0q_252 awsui_input-has-icon-left_2rhyz_clr0q_231']") }
    instance_type.clear
    instance_type.send_keys("m5.large")
    sleep(2)

    instance_type_radio_button = @wait.until { @driver.find_element(:xpath, '/html/body/div[3]/div/div[2]/div/div/main/div/div[2]/div/div[1]/div/div/div/div/div/div[1]/div[2]/div[2]/div/div/div/div[1]/div/div/span[1]/div/div/div/div[2]/div/div/div/div/div/div[6]/div/div/div/div[2]/div[1]/table/tbody/tr/td[1]/span/label/span/span/span[1]/input') }
    instance_type_radio_button.click

    payment_type = @wait.until { @driver.find_element(:id, "on-demand") }
    payment_type.click

    save_element = @wait.until { @driver.find_element(:xpath, "/html/body/div[3]/div/div[3]/div/div[2]/div/div[3]/div/div/div/div[3]/div/button") }
    save_element.click
  end
end
