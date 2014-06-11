#!/usr/bin/env ruby
require 'net/scp'
# Upload local file/directory to remote directory

uFile = ARGV[0]
nFile = ARGV[1]

File.open(uFile) do |f|
  Net::SCP.start("192.168.2.3", "patrick", :password => "b1gPimpin") do |scp|
  scp.upload! uFile, "/home/patrick/media/movies/" + nFile
  end
end