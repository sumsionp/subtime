#!/usr/bin/env ruby

class Timer
# Takes the number of minutes, and a hash of messages to be said
  def self.start(minutes, messages=nil)
    alert_start(minutes)
    count_down(minutes, messages)
    play_done_chime
  end

  def self.count_down(minutes, messages)
    minutes.downto 1 do |i|
      sleep 60
      puts i
      if messages && messages[i]
        `say #{messages[i]}`
      end
    end
  end

  def self.alert_start(minutes)
    puts "Starting timer for #{minutes} minutes..."
  end

  def self.play_done_chime
    `say timer done`
  end
end
