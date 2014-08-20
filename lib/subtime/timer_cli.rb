require 'optparse'
require 'ostruct'

class TimerCLI
  def self.parse(args)
    options = OpenStruct.new

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: subtime [options]"

      opts.separator ""

      opts.on("-m", "--minutes MINUTES",
              "Total number of minutes to run timer") do |mins|
        options.minutes = mins
      end
    end
  end
end
