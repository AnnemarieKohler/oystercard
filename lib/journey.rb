class Journey
  attr_reader :entry_station, :exit_station, :journey

  def start_journey(station)
    @entry_station = station
  end

  def complete_journey(station)
    @exit_station = station
  end

  def make_journey
    @journey = { entry_station: entry_station, exit_station: exit_station }
  end
end
