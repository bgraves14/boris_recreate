require_relative 'BikeClass'

class DockingStation 
	def initialize
		@bikes = []
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
		@bikes.size >= 20
	end

	def empty?
		@bikes.empty?
	end


end
