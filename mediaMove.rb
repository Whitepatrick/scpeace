#!/usr/bin/env ruby
require 'net/scp'
# Upload local file/directory to remote directory
# ruby mediaMove.rb <file/folder> <new name>

# Requires two arguments 
# mediaObject = file/folder to move from local to remote
# newName = new name of file/folder on remote file system (keeps names within dir)

mediaObject = ARGV[0]
newName = ARGV[1]

# Method for moving single file from local to remote
# Edit credentials for remote host
def fileUp(mediaObject, newName)
  File.open(mediaObject) do |f|
    Net::SCP.start("remote host", "user", :password => "password") do |scp|
    scp.upload mediaObject, "remote file path" + newName,
    :verbose => true
    end
  end
end

# Method for recursively moving a directory from local to remote
# Edit credentials for remote host
def dirUp(mediaObject, newName)
  Dir.open(mediaObject) do |f|
    Net::SCP.start("remote host", "user", :password => "password") do |scp|
    scp.upload mediaObject, "remote file path" + newName,
    :recursive => true, :verbose => true
    end
  end
end

# Main logic for where to send media object
if mediaObject == nil
  puts "Specify a file or folder, Turkey!"
elsif
  Dir.exists?(mediaObject)
  dirUp(mediaObject, newName)
  puts "Directory Succeffuly Uploaded!"
elsif
  File.exists?(mediaObject)
  fileUp(mediaObject, newName)
  puts "File Successfully Uploaded!"
end