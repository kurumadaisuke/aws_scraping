require 'selenium-webdriver'

class Fargate
  def initialize(driver, wait)
    @driver = driver
    @wait = wait
  end

  def configure_fargate
    @driver.get 'https://calculator.aws/#/createCalculator/Fargate'
    sleep(3)
  end
end
