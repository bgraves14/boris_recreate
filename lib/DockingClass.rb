require_relative 'BikeClass'

class DockingStation 
	def initialize
		@bikes = []
	end

	def release_bike
		fail "No bikes available" if @bikes.empty?
		@bikes.pop
	end

	def dock bike
		fail "No spaces available" if @bikes.size >= 20
		@bikes << bike
	end


end
