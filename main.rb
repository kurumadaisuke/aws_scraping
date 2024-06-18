require 'selenium-webdriver'
require 'json'
Dir[File.join(__dir__, 'services', '*.rb')].each { |file| require_relative file }

driver = Selenium::WebDriver.for :chrome
driver.get 'https://calculator.aws'
driver.manage.window.maximize
wait = Selenium::WebDriver::Wait.new(timeout: 30)

aws_calculator = AWSCalculator.new(driver, wait)
aws_calculator.create_estimate_button_add
aws_calculator.resion_select_tokyo

config_file_path = File.join(__dir__, 'config.json')
config = JSON.parse(File.read(config_file_path), symbolize_names: true)

config.keys.map(&:to_s).each do |key|
  if key == "ec2"
    ec2 = EC2.new(driver, wait, config[:ec2])
    ec2.configure_ec2_instance
  elsif key == "natgw"
    natgateway = NatGateway.new(driver, wait, config[:natgw])
    natgateway.configure_nat_gateway
  elsif key == "s3"
    s3 = S3.new(driver, wait)
    s3.configure_s3
  elsif key == "ecr"
    ecr = ECR.new(driver, wait)
    ecr.configure_ecr
  elsif key == "fargate"
    fargate = Fargate.new(driver, wait)
    fargate.configure_fargate
  end
end

aws_calculator.save

loop do
  sleep(1)
end
