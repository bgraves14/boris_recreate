require 'DockingClass.rb'
require 'BikeClass.rb'

describe DockingStation do

	it { is_expected.to respond_to(:release_bike) }
	it { is_expected.to respond_to(:dock).with(1).argument}

	it "create a bike and check if works" do
		subject.dock Bike.new
		bike = subject.release_bike
		expect(bike).to be_working
	end

	describe "#release_bike" do
		it "raise a flag if there are no bikes" do
			expect{subject.release_bike}.to raise_error "No bikes available"
		end
	end
end