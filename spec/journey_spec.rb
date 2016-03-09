require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  let(:euston) { double :entry_station }
  let(:camden) { double :exit_station }
  before do
    journey.start_journey(euston)
    journey.complete_journey(camden)
  end
  describe "#start_journey" do
    it 'should store entry_station' do
      expect(journey.entry_station).to eq euston
    end
  end

  describe "#complete_journey" do
    it 'should store exit_station' do
      expect(journey.exit_station).to eq camden
    end
  end

  describe "#make_journey" do
    it 'returns a hash of entry_station and exit_station' do
      expect(journey.make_journey).to eq ({ entry_station: euston, exit_station: camden })
    end
  end
end
