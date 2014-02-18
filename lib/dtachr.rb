# Read $HOME/.dtachr for where to put sockets
# Generate a 256 character file name if a socket isn't given
# Everything after the optional socket name is the command
require 'rubygems'
require 'docopt'

module Dtachr

  VERSION = '0.0.5'
  NAME = 'dtachr'

  DOC = <<-DOCOPT
    dtachr

    Usage:
      #{Dtachr::NAME} [--socket=<sock>] [--title=<title>] [--message=<message>] [--] <parts>...
      #{Dtachr::NAME} -h | --help
      #{Dtachr::NAME} -v | --version

    Options:
      -h --help               Show this screen
      -v --version            Show the version
      -n --socket=<sock>      Temporary file to use as socket for dtach command
      -t --title=<title>      Title to use for terminal-notifier
      -m --message=<message>  Message to use with terminal-notifier

    DOCOPT

  class Runner

    def initialize(args)
      @opts = Docopt::docopt(Dtachr::DOC, {
        :argv => args,
        :version => Dtachr::VERSION
      })
      @socket = @opts['--socket'] || gen_socket
      @command = @opts['<parts>'].join(' ')
    rescue Docopt::Exit => e
      puts e.message
    end

    def call
      return unless @opts
      execute("dtach -n #{@socket} #{@command} && #{notify_command}")
    end

    private

    def execute(command)
      `#{command}`
    end

    def gen_socket
      candidates = [('a'..'z'), ('A'..'Z'), (0..9)].map { |i| i.to_a }.flatten
      name = (0...32).map { candidates[rand(candidates.length)] }.join
      if (File.exists?(name)) then gen_socket else name end
    end

    def notify_command
      notifier = "terminal-notifier"
      message = '-message ' + (@opts['--message'] || "'`#{@command}` finished.'")
      title = @opts['--title'].dup if !@opts['--title'].nil?
      title.insert(0, '-title ') if !title.nil? && title.length > 0
      [notifier, title, message].join(' ')
    end

  end

end
