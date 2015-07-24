require 'DockingClass.rb'
require 'BikeClass.rb'
require 'byebug'

describe DockingStation do

	it { is_expected.to respond_to(:release_bike) }
	it { is_expected.to respond_to(:dock).with(1).argument}

	it "create a bike and check if works" do
		subject.dock Bike.new
		bike = subject.release_bike
		puts bike
		expect(bike).to be_working
	end

	it 'checks capacity is full' do
		expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
	end

	describe "#release_bike" do
		it "raise a flag if there are no bikes" do
			expect{subject.release_bike}.to raise_error "No bikes available"
		end
	end

	describe "#dock" do
		it "raise a flag when station is full" do
			subject.capacity.times {subject.dock Bike.new}
			expect{subject.dock Bike.new}.to raise_error "No spaces available"
		end	

		it "raise a flag if it tries to release a bad bike" do
			bike = Bike.new
			bike.report_broken
			subject.dock bike
			expect(subject.release_bike).to be_working
		end
	end

	describe "#capacity" do

		it "checking the capacity method can take more than 20 bikes" do
			station = DockingStation.new 50
			expect(station.capacity).to eq 50
		end
	end
end