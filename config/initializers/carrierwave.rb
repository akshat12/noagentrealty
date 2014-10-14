# Copyright (c) 2008-2013 Jonas Nicklas

# Permission is hereby granted, free of charge, to any person obtaining a copy of 
# this software and associated documentation files (the "Software"), to deal in the 
# Software without restriction, including without limitation the rights to use, 
# copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the 
# Software, and to permit persons to whom the Software is furnished to do so, 
# subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION 
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# encoding: utf-8

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                                          # required
    :aws_access_key_id      => 'AKIAIOMP7VALWYACEDMQ',                         # required
    :aws_secret_access_key  => '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',     # required
    :region                 => 'us-east-1'                    # optional, defaults to 'us-east-1'
    # :hosts                  => 's3.example.com',               # optional, defaults to nil
    # :endpoint               => 'https://s3.example.com:8080'   # optional, defaults to nil
  }
  config.fog_directory  = 'cfz'                     # required
  config.fog_public     = false                                    # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end