#!/usr/bin/env ruby
require 'net/scp'

# Upload local file/directory to remote directory
file_name = ARGV
if file_name != nil
  Net::SCP.upload!("192.168.2.3", "patrick",
  file_name, "/home/patrick/media/movies",
  :ssh => { :password => "b1gPimpin"})
else
  puts "Specify a file turkey"
end