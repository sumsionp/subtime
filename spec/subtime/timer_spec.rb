require 'rspec/given'
require 'subtime/timer'

describe Timer do
  describe "#start" do
    context "without messages" do
      Given(:output) { STDOUT }
      Given(:minutes) { 0 }
      Given(:timer) { Timer.new(minutes) }

      When { timer.start }
      Then { expect(output).to receive(:puts).with("Started timer for #{minutes} minutes...") }
    end
  end
end
