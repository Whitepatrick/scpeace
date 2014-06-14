#!/usr/bin/env ruby
require 'net/scp'
# Upload local file/directory to remote directory

# accepts two arguments 
# mediaObject = file/folder to move from local to remote
# newName = new name of file/folder on remote file system (keeps names within dir)

mediaObject = ARGV[0]
newName = ARGV[1]

# Main logic for where to send media object
if mediaObject == nil
  puts "Specify a file or folder, Turkey!"
elsif
  Dir.exist?(mediaObject)
  DirUp(mediaObject, newName)
  puts "Directory Succeffuly Uploaded!"
elsif
  File.exists?(uploadFile)
  FileUp(mediaObject, newName)
  puts "File Successfully Uploaded!"
end

# Method for moving single file from local to remote
def FileUp(mediaObject, newName)
  File.open(mediaObject) do |f|
    Net::SCP.start("192.168.2.3", "patrick", :password => "password") do |scp|
    scp.upload mediaObject, "/home/patrick/media/movies/" + newName,
    :verbose => true
    end
  end
end

# Method for recursively moving a directory from local to remote
def DirUp(mediaObject)
  Dir.open(mediObject) do |f|
    Net::SCP.start("192.168.2.3", "patrick", :password => "password") do |scp|
    scp.upload mediaObject, "/home/patrick/media/movies/" + newName,
    :recursive => true, :verbose => true
    end
  end
end