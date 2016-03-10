require 'journey_log'

describe JourneyLog do
  let(:journey_init) { double(:journey, complete_journey: nil, fare: 1) }
  let(:journey_class) { double(:journey_class, new: journey_init) }

  subject(:log) {described_class.new(journey_class)}
  let(:station) { double :station }

  describe '#entry_station' do
    it 'creates a journey var when instance of journey' do
      log.entry_station(station)
      expect(log.journey).to eq journey_init
    end

    it 'log journey if there is an instance of journey' do
      allow(log).to receive(:journey).and_return(journey_init)
      log.entry_station(station)
      expect(log.journey).to eq journey_init
    end
  end

end
