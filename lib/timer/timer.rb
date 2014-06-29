#!/usr/bin/env ruby

class Timer
  def initialize(minutes, messages=nil)
    @minutes = minutes
    @messages = messages
  end

  def start
    alert_start
    count_down
    play_done_chime
  end

  def count_down
    @minutes.downto 1 do |i|
      sleep 60
      puts i
      if @messages && @messages[i]
        `say #{@messages[i]}`
      end
    end
  end

  def alert_start
    puts "Starting timer for #{@minutes} minutes..."
  end

  def play_done_chime
    `say timer done`
  end
end
