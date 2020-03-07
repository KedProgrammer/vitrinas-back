require 'aws-sdk-s3'

Aws.config.update({
  region: 'us-west-2',
  credentials: Aws::Credentials.new('AKIAJQWACFJ4ABNCNRIA', '2pdtFzJR94l7fSr+M5TRNkM63fSf0Jqs1IY+c8ms')
})