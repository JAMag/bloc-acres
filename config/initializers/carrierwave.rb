CarrierWave.configure do |config|
  config.aws_credentials = {
    provider:   'AWS',
    aws_access_key_id:   ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region:   'us-west-2'
  }
  config.aws_bucket = ENV['AWS_BUCKET']

end