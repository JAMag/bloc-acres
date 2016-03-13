# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
  config.s3_access_key_id     = ENV['S3_ACCESS_KEY_ID']
  config.s3_secret_access_key = ENV['S3_SECRET_ACCESS_KEY']
end