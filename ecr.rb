class ECR
  def initialize(driver, wait)
    @driver = driver
    @wait = wait
  end

  def configure_ecr
    @driver.get 'https://calculator.aws/#/createCalculator/ECR'
    sleep(3)

    registry_valume = @wait.until { @driver.find_element(:xpath, "//input[@aria-label='Amount of data stored Value']") }
    registry_valume.send_keys("100")

    save_element = @wait.until { @driver.find_element(:xpath, "/html/body/div[3]/div/div[3]/div/div[2]/div/div[3]/div/div/div/div[3]/div/button") }
    save_element.click
  end
end
