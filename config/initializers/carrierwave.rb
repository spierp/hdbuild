CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAINILF5RCP4GU5E6A',       # required
    :aws_secret_access_key  => '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',       # required
    :region                 => 'us-west-2'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'hdbuild'                     # required
#  config.cache_dir = "#{Rails.root}/tmp/uploads"
#  config.fog_public     = false                                   # optional, defaults to true
#  config.fog_attributes = {"Content-Disposition" => "attachment;"}  # optional, defaults to {}
#  config.asset_host     = 'https://assets.example.com'            # optional, defaults to nil
end