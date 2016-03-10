# require_relative 'lib/station.rb'
require './lib/oystercard.rb'
require './lib/journey.rb'
require './lib/station.rb'
require './lib/journey_log.rb'


euston = Station.new(:Euston,2)
angel = Station.new(:Angel,1)
oys = Oystercard.new(JourneyLog,Journey)

oys.top_up 30
oys.touch_in(euston) # station should be optional
oys.touch_out(angel)
p oys.balance


# station should be optional

oys.touch_out(euston)
#
oys.touch_out(euston) # 82
# p oys.balance

oys.touch_in(angel)
oys.touch_in(euston) # 76
p oys.balance
p oys.journeys

oys.touch_out(angel) # 75
# p oys.balance

# p oys.journeys
