require 'rspec/given'
require 'subtime/timer'

describe Timer do
  describe "#start" do
    context "without messages" do
      Given(:minutes) { 0 }
      Given(:timer) { Timer.new(minutes) }

      Then { expect { timer.start }.to output("Starting timer for #{minutes} minutes...\n").to_stdout }
    end
  end
end
