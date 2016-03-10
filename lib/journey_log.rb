class JourneyLog

  attr_reader :journey, :journeys

  def initialize(journey_class: )
    @journey_class = journey_class
    @journeys = []
  end

  def entry_station(station)
    log_journey if @journey
    @journey = @journey_class.new(station)
  end

  def exit_station(station)
    @journey = @journey_class.new if @journey.nil?
    @journey.complete_journey(station)
    log_journey
  end


  def fare
    @journey.fare
  end


  private

  def log_journey
    @journeys << @journey
    @journey = nil
  end
end
