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

      it "says 'timer done' when finished" do
        expect(timer).to receive(:`).with("say timer done")

        timer.start
      end
    end

    context "for 10 minutes" do
      let(:minutes) { 10 }
      let(:messages) { { 5 => "something", 2 => "something else" } }
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

      context "with message 'something' at 5" do
        it "says 'something'" do
          expect(timer).to receive(:`).with("say something")

          timer.start
        end
      end

      context "with message 'something else' at 2" do
        it "says 'something else'" do
          expect(timer).to receive(:`).with("say something else")

          timer.start
        end
      end
    end
  end
end
