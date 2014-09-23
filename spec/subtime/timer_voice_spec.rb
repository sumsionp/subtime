require 'subtime/timer_voice'

module SubTime
  describe TimerVoice do
    describe ".say_message" do
      it "says a message" do
        expect(TimerVoice).to receive(:`).with("say some message")

        TimerVoice.say_message("some message")
      end
    end
  end
end
