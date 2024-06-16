require 'selenium-webdriver'

class AWSCalculator
  def initialize(driver, wait)
    @driver = driver
    @wait = wait
  end

  def create_estimate_button_add
    create_estimate_e = @wait.until { @driver.find_element(:xpath, "//span[text()='Create estimate']") }
    create_estimate_e.find_element(:xpath, "./ancestor::button").click
  end

  def resion_select_tokyo
    dialog_e = @wait.until { @driver.find_element(:xpath, "//button[@aria-haspopup='dialog']") }
    dialog_e.click

    resion_name_input_e = @wait.until { @driver.find_element(:xpath, "//input[@class='awsui_input_2rhyz_clr0q_103 awsui_input-has-icon-left_2rhyz_clr0q_231 awsui_input-has-no-border-radius_2rhyz_clr0q_268']") }
    resion_name_input_e.send_keys("Asia Pacific (Tokyo)")

    resion_name_input_e.send_keys(:arrow_down)
    resion_name_input_e.send_keys(:enter)
  end
end
