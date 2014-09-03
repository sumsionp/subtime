require 'optparse'
require 'ostruct'

class TimerCLI
  def self.parse(args)
    options = OpenStruct.new

    options.messages = {}

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: subtime [options]"

      opts.separator ""
      opts.separator "Specific options:"

      opts.on("-m", "--minutes MINUTES", Integer,
              "Total number of minutes to run timer") do |mins|
        options.minutes = mins
      end

      opts.on("-s", "--say [MINUTE,MESSAGE]", Array,
              "Message to say with minute to say it at",
              "   Example: -s 9,'Get up and stretch'",
              "   This will say 'Get up and stretch' at minute 9",
              "   NOTE: The integer must be within the range 1-MINUTES") do |minute_messages|
        options.messages = Hash[*minute_messages]
      end

      opts.separator ""
      opts.separator "Common options:"

      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end
    end

    opt_parser.parse!(args)
    options
  end
end
