require 'optparse'
require 'ostruct'

class TimerCLI
  def self.parse(args)
    options = OpenStruct.new

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: subtime [options]"

      opts.separator ""
      opts.separator "Specific options:"

      opts.on("-m", "--minutes MINUTES", Integer,
              "Total number of minutes to run timer") do |mins|
        options.minutes = mins
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
