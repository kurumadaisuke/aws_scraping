class S3
  def initialize(driver, wait)
    @driver = driver
    @wait = wait
  end

  def configure_s3
    @driver.get 'https://calculator.aws/#/createCalculator/S3'
    sleep(3)

    s3_valume = @wait.until { @driver.find_element(:xpath, "//input[@aria-label='S3 Standard storage Value']") }
    s3_valume.send_keys("100")

    save_element = @wait.until { @driver.find_element(:xpath, "/html/body/div[3]/div/div[3]/div/div[2]/div/div[3]/div/div/div/div[3]/div/button") }
    save_element.click
  end
end
