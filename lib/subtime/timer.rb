#!/usr/bin/env ruby

class Timer
  def initialize(output, minutes, messages=nil)
    @output = output
    @minutes = minutes
    @messages = messages
  end

  def start
    alert_start
    count_down
    play_done_chime
  end

  def count_down
    @minutes.downto 1 do |minute|
      sleep 60
      @output.puts minute
      if @messages && @messages[minute]
        `say #{@messages[minute]}`
      end
    end
  end

  def alert_start
    @output.puts "Starting timer for #{@minutes} minutes..."
  end

  def play_done_chime
    `say timer done`
  end
end
