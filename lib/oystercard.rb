class Oystercard

  attr_reader :balance, :journeys

  MAX_AMOUNT = 90
  MIN_FARE = 1
  MAX_ERROR = "Cannot exceed max balance £#{MAX_AMOUNT}"
  MIN_ERROR = "You need to have at least £#{MIN_FARE}"

  def initialize(journey_log_class,journey_class)
    @journey_log = journey_log_class.new(journey_class)
    # @journey_class = journey_class
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise MAX_ERROR if (balance + amount) > MAX_AMOUNT
    @balance += amount
  end

  def touch_in(station)
    raise MIN_ERROR unless balance > MIN_FARE
    @journey_log.entry_station(station)
    # log_journey unless @journey.nil?
    # @journey = @journey_class.new(station)
  end

  def touch_out(station)
    # @journey = @journey_class.new if @journey.nil?
    # @journey.complete_journey(station)
    # log_journey
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  # def log_journey
  #   deduct(@journey.fare)
  #   @journeys << @journey
  #   @journey = nil
  # end

end
