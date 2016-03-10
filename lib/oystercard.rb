require_relative 'journey_log'

class Oystercard

  DEFAULT_BALANCE = 0
  MAX_LIMIT = 90
  MIN_FARE = 1

  MAX_ERROR = "Maximum balance reached"
  MIN_ERROR = "You must top-up your Oystercard"
  attr_reader :balance

  def initialize(journey_log)
    @journey_log = journey_log
    @balance = DEFAULT_BALANCE
  end

  def top_up top_amount
    raise MAX_ERROR if @balance + top_amount > MAX_LIMIT
    @balance += top_amount
  end

  def touch_in(station)
    raise MIN_ERROR if @balance < MIN_FARE
    @journey_log.start_new_journey(station)
  end

  def touch_out(station)
    @journey_log.close_current_journey(station)
    @balance -= @journey_log.outstanding_fares
  end

end








  #
  # DEFAULT_BALANCE = 0
  # MAX_LIMIT = 90
  # MIN_FARE = Journey::MIN_FARE
  # PENALTY_FARE = Journey::PENALTY_FARE
  # MIN_ERROR = "You must have over £#{Oystercard::MIN_FARE} on your card"
  # MAX_ERROR = "Exceeded £#{MAX_LIMIT} limit"
  #
  # attr_reader :balance, :journeys
  #
  # def initialize(journey_log_class: JourneyLog)
  #   @balance = DEFAULT_BALANCE
  #   @journeys = []
  #   #@journeys = journey_log_class.new
  #   @journey_class = journey_log_class
  # end
  #
  # def top_up(amount)
  #   raise MAX_ERROR if @balance + amount > MAX_LIMIT
  #   @balance += amount
  # end
  #
  # def in_journey?
  #   !@journey.nil?
  # end
  #
  # def touch_in(station)
  #   push_journey(@journey) if in_journey?
  #   raise MIN_ERROR if @balance < MIN_FARE
  #   start_journey(station)
  # end
  #
  # def touch_out(station)
  #   @journey = @journey_class.new unless in_journey?
  #   @journey.add_station(:exit_station => station)
  #   push_journey(@journey)
  # end
  #
  # private
  #
  # def start_journey(station)
  #   @journey = @journey_class.new
  #   @journey.add_station(:entry_station => station)
  # end
  #
  # def push_journey(journey)
  #   @balance -= @journey.fare
  #   @journeys << @journey
  #   @journey = nil
  # end
