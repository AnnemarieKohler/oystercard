require 'pry'
require 'journey_log'

describe JourneyLog do
  let(:journey_init) { double(:journey, complete_journey: nil, fare: 1) }
  let(:journey_class) { double(:journey_class, new: journey_init) }
  let(:station) { double :station }
  subject(:log) { described_class.new(journey_class: journey_class) }

  describe '#entry_station' do
    it 'creates a journey var when instance of journey' do
      log.entry_station(station)
      expect(log.journey).to eq journey_init
    end

    it 'log journey if there is an instance of journey' do
      2.times {log.entry_station(station)}
      expect(log.journeys).to include journey_init
    end
  end

  describe '#exit_station' do
    it 'receives a station' do
      log.entry_station(station)
      log.exit_station(station)
      expect(journey_init).to have_received(:complete_journey).with(station)
    end

    it 'calls log_journey' do
      allow(log).to receive(:log_journey)
      log.entry_station(station)
      log.exit_station(station)
      expect(log).to have_received(:log_journey)
    end

    it 'creates journe var if no journey' do
      expect{ log.exit_station(station)}.to change {log.journeys.size}.by(1)
    end
  end

end
