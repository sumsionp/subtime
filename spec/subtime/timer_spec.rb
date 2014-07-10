require 'rspec/given'
require 'subtime/timer'

describe Timer do

  let(:output) { double('output').as_null_object }

  describe "#start" do
    context "without messages" do
      let(:minutes) { 0 }
      let(:timer) { Timer.new(output, minutes) }

      it "outputs 'Starting timer for 0 minutes...'" do
        expect(output).to receive(:puts).with("Starting timer for #{minutes} minutes...")

        timer.start
      end
    end
  end
end
