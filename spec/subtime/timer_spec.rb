require 'rspec/given'
require 'subtime/timer'
require 'kernel/kernel'

module SubTime
  describe Timer do

    before do
      $stdout = StringIO.new
    end

    let(:timer_output) { double('timer_output').as_null_object }

    describe "#start" do
      context "without messages" do
        let(:minutes) { 0 }
        let(:timer) { Timer.new(timer_output, minutes) }

        it "outputs 'Starting timer for 0 minutes...'" do
          expect(timer_output).to receive(:puts).with("Starting timer for #{minutes} minutes...")

          timer.start
        end
      end

      context "for 10 minutes with code blocks" do
        let(:minutes) { 10 }
        let(:messages) { { 5 => lambda { puts "Something" },
          2 => lambda { puts "something else" } } }
        let(:timer) { Timer.new(timer_output, minutes, messages) }

        it "outputs 'Starting timer for 10 minutes...'" do
          expect(timer_output).to receive(:puts).with("Starting timer for #{minutes} minutes...")

          timer.start
        end

        it "outputs each minute from 10 down to 1" do
          10.downto(1) do |minute|
            expect(timer_output).to receive(:puts).with(minute)
          end

          timer.start
        end

        it "calls the specified code blocks" do
          expect { timer.start }.to output(/Something/).to_stdout
          expect { timer.start }.to output(/something else/).to_stdout
          end
      end
    end
  end
end
