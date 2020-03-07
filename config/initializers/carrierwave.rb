CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJQWACFJ4ABNCNRIA',                        # required unless using use_iam_profile
    aws_secret_access_key: '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',                        # required unless using use_iam_profile                         # optional, defaults to false
    region:                'sa-east-1'                # optional, defaults to 'us-east-1'            # optional, defaults to nil
  }
  config.fog_directory  = 'vitrinas-fotos'                                      # required                                                # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end