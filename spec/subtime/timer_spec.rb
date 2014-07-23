require 'rspec/given'
require 'subtime/timer'

module Kernel
  def sleep(seconds)
  end
end

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

    context "for 10 minutes with code blocks" do
      let(:minutes) { 10 }
      let(:messages) { { 5 => lambda { puts "Something" },
                         2 => lambda { puts "something else" } } }
      let(:timer) { Timer.new(output, minutes, messages) }

      it "outputs 'Starting timer for 10 minutes...'" do
        expect(output).to receive(:puts).with("Starting timer for #{minutes} minutes...")

        timer.start
      end

      it "outputs each minute from 10 down to 1" do
        10.downto(1) do |minute|
          expect(output).to receive(:puts).with(minute)
        end

        timer.start
      end

      it "calls the specified code blocks" do
        expect { timer.start }.to output.to_stdout
        expect { timer.start }.to output('something else').to_stdout
      end
    end
  end
end
