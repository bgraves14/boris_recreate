require_relative 'BikeClass'

class DockingStation 
DEFAULT_CAPACITY = 20

attr_accessor :capacity

	def initialize
		@bikes = []
		self.capacity = DEFAULT_CAPACITY
	end

	def release_bike
		fail "No bikes available" if empty?
		@bikes.pop
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
