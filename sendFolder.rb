#!/usr/bin/env ruby
require 'net/scp'
# Upload local file/directory to remote directory

uploadFile = ARGV[0]
newFile = ARGV[1]

Dir.open(uploadFile) do |f|
  Net::SCP.start("192.168.2.3", "patrick", :password => "password") do |scp|
  scp.upload uploadFile, "/home/patrick/media/movies/" + newFile,
  :recursive => true, :verbose => true
  end
end