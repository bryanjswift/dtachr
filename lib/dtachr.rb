# Read $HOME/.dtachr for where to put sockets
# Generate a 256 character file name if a socket isn't given
# Everything after the optional socket name is the command
require 'rubygems'
require 'bundler/setup'
require 'docopt'

doc = <<DOCOPT
dtachr

Usage:
  #{__FILE__} [--socket=<sock>] <command>
  #{__FILE__} -h | --help
  #{__FILE__} -v | --version

Options:
  -h --help         Show this screen
  -v --version      Show the version
  --socket=<sock>   Temporary file to use as socket for dtach command

DOCOPT

module Dtachr
  
  class Runner
    
    def self.call(args)
      require 'pp'
      pp Docopt::docopt(doc, { :version => '0.0.1α' })
    rescue Docopt::Exit => e
      puts e.message
    end
    
  end
  
end