# Read $HOME/.dtachr for where to put sockets
# Generate a 256 character file name if a socket isn't given
# Everything after the optional socket name is the command
require 'rubygems'
require 'docopt'

module Dtachr
  
  VERSION = '0.0.3b'
  NAME = 'dtachr'
  
  DOC = <<-DOCOPT
    dtachr

    Usage:
      #{Dtachr::NAME} [--socket=<sock>] <parts>...
      #{Dtachr::NAME} -h | --help
      #{Dtachr::NAME} -v | --version

    Options:
      -h --help             Show this screen
      -v --version          Show the version
      -n --socket=<sock>    Temporary file to use as socket for dtach command

    DOCOPT
  
  class Runner
    
    def initialize(args)
      @opts = Docopt::docopt(Dtachr::DOC, {
        :argv => args,
        :version => Dtachr::VERSION
      })
      @socket = @opts['socket'] || gen_socket
      @command = @opts['<parts>'].join(' ')
    rescue Docopt::Exit => e
      puts e.message
    end
    
    def call
      return unless @opts
      execute("dtach -n #{@socket} #{@command} && terminal-notifier -message '`#{@command}` finished.'")
    end
    
    private
    
    def execute(command)
      `#{command}`
    end
    
    def gen_socket
      "tmp"
    end
    
  end
  
end