
require 'BikeClass'

class DockingStation 
DEFAULT_CAPACITY = 20

attr_accessor :capacity

	def initialize capacity = DEFAULT_CAPACITY
		@bikes = []
		@capacity = capacity
	end

	def release_bike
		good_bikes = []
		fail "No bikes available" if empty?
		good_bikes = @bikes.select {|bike| bike.working? == true}
		good_bikes.pop
	end

	def dock bike
		fail "No spaces available" if full?
		@bikes << bike 
	end

	def full?
		@bikes.size >= capacity
	end

	def empty?
		@bikes.empty?
	end


end
