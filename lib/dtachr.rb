# Read $HOME/.dtachr for where to put sockets
# Generate a 256 character file name if a socket isn't given
# Everything after the optional socket name is the command
require 'rubygems'
require 'bundler/setup'
require 'docopt'

module Dtachr
  
  VERSION = '0.0.1'
  DOC = <<-DOCOPT
    dtachr

    Usage:
      #{__FILE__} [--socket=<sock>] <parts>...
      #{__FILE__} -h | --help
      #{__FILE__} -v | --version

    Options:
      -h --help         Show this screen
      -v --version      Show the version
      -c --socket=<sock>   Temporary file to use as socket for dtach command

    DOCOPT
  
  class Runner
    
    def self.call(args)
      require 'pp'
      opts = Docopt::docopt(Dtachr::DOC, { :version => Dtachr::VERSION })
      pp opts
    rescue Docopt::Exit => e
      puts e.message
    end
    
  end
  
end