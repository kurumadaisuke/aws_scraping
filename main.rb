require 'selenium-webdriver'
require_relative 'aws_calculator'
require_relative 'ec2'
require_relative 'nat_gateway'
require_relative 'fargate'
require_relative 's3'
require_relative 'ecr'

driver = Selenium::WebDriver.for :chrome
driver.get 'https://calculator.aws'
driver.manage.window.maximize

wait = Selenium::WebDriver::Wait.new(timeout: 30)

aws_calculator = AWSCalculator.new(driver, wait)
aws_calculator.create_estimate_button_add
aws_calculator.resion_select_tokyo

ec2 = EC2.new(driver, wait)
ec2.configure_ec2_instance

natgateway = NatGateway.new(driver, wait)
natgateway.configure_nat_gateway

s3 = S3.new(driver, wait)
s3.configure_s3

ecr = ECR.new(driver, wait)
ecr.configure_ecr

# fargate = Fargate.new(driver, wait)
# fargate.configure_fargate

aws_calculator.save

loop do
  sleep(1)
end
