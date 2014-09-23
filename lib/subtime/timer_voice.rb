module SubTime
  class TimerVoice
    def self.say_message(message)
      `say #{message}`
    end
  end
end
