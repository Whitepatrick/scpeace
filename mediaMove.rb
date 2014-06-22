#!/usr/bin/env ruby
require 'net/scp'

# Upload local file/directory to remote directory
# ruby mediaMove.rb <file/folder> <new name> <tv/movies>

# Requires two arguments 
# mediaObject = file/folder to move from local to remote
# newName = new name of file/folder on remote file system (keeps names within dir)
# destination = switch between two paths (tv or movies in my case)

mediaObject = ARGV[0]
newName = ARGV[1]
destination = ARGV[2]

# Add vars here
# Need vars to be passed to methods



# Method for moving single file from local to remote
# Edit credentials for remote host
def fileUp(mediaObject, newName)
  File.open(mediaObject) do |f|
    Net::SCP.start(remoteServer, login, :password => password) do |scp|
    scp.upload mediaObject, remotePath + newName,
    :verbose => true
    end
  end
end

# Method for recursively moving a directory from local to remote
# Edit credentials for remote host
def dirUp(mediaObject, newName)
  Dir.open(mediaObject) do |f|
    Net::SCP.start(remoteServer, login, :password => password) do |scp|
    scp.upload mediaObject, remotePath + newName,
    :recursive => true, :verbose => true
    end
  end
end

# Pre sort media objects destination
if destination != 'tv' || 'movies'
  puts 'Error: specify destination (movies/tv)'
elsif
  destination == 'tv'
  remotePath = tvPath
  puts 'Transferring to TV'
else
  remotePath = moviesPath
  puts 'Transferring to Movies'
end

# Main logic on how to send media object
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