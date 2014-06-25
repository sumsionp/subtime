#!/usr/bin/env ruby

class Timer
# Takes the number of minutes, and a hash of messages to be said
  def self.start(minutes, messages=nil)
    # Alert user how many minutes the timer will run
    puts "Starting timer for #{minutes} minutes..."
  
    # Set a loop to run through the number of minutes sleeping 60 sec for each one
    count_down(minutes, messages)

    # Play a chime when finished
    `say timer done`
  end

  def self.count_down(starting_with, messages)
    starting_with.downto 1 do |i|
      sleep 60
      puts i
      if messages && messages[i]
        `say #{messages[i]}`
      end
    end
  end
end
