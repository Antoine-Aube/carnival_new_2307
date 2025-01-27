require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do 
  let(:ride1) { Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle }) }
  let(:ride2) { Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle }) }
  let(:ride3) { Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling }) }
  let(:ride4) { Ride.new({ name: 'Super Man', min_height: 54, admission_fee: 5, excitement: :thrilling }) }
  let(:ride5) { Ride.new({ name: 'Log Flume', min_height: 54, admission_fee: 10, excitement: :thrilling }) }
  let(:visitor1) { Visitor.new('Bruce', 54, '$10') }
  let(:visitor2) { Visitor.new('Tucker', 36, '$5') }
  let(:visitor3) { Visitor.new('Penny', 64, '$15') }
  let(:visitor4) { Visitor.new('Abdul', 72, '$100') }
  let(:carnival) {  Carnival.new(14)}
  let(:carnival_2) {  Carnival.new(18)}
  
  describe "it exists and has attributes" do 
    it{ expect(carnival).to be_a Carnival }
    it{ expect(carnival.duration).to eq(14) }
    it{ expect(carnival.rides).to eq([]) }
  end

  describe "#add_ride" do 
    it "can add ride objects to it's ride attribute" do
      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      carnival.add_ride(ride3)

      expect(carnival.rides).to eq([ride1, ride2, ride3])
    end
  end

  describe "#most_popular ride" do 
    it "can return ride object that has been riden the most" do 
      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      carnival.add_ride(ride3)

      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor3.add_preference(:gentle)
      visitor4.add_preference(:gentle)
      visitor3.add_preference(:thrilling)
      visitor4.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor3)
      ride1.board_rider(visitor3)
      ride1.board_rider(visitor4)
      
      
      ride2.board_rider(visitor1)
      ride2.board_rider(visitor2)
      ride2.board_rider(visitor4)
      ride2.board_rider(visitor4)
      ride2.board_rider(visitor4)
      ride2.board_rider(visitor4)
      ride2.board_rider(visitor4)
      ride2.board_rider(visitor4)
      ride2.board_rider(visitor4)
      ride2.board_rider(visitor4) #Abdul is a big fan of the Ferris Wheel"
      
      ride3.board_rider(visitor3)
      ride3.board_rider(visitor4)
      # require 'pry';binding.pry
      expect(carnival.most_popular_ride).to eq(ride2)
    end
  end

  describe "#most_profitable_ride" do 
    it "returns the ride object that is the most profitable" do 
      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      carnival.add_ride(ride3)

      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor3.add_preference(:gentle)
      visitor4.add_preference(:gentle)
      visitor3.add_preference(:thrilling)
      visitor4.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor3)
      ride1.board_rider(visitor3)
      ride1.board_rider(visitor4)
      
      
      ride2.board_rider(visitor1)
      ride2.board_rider(visitor2)
      ride2.board_rider(visitor4)
      ride2.board_rider(visitor4)
      ride2.board_rider(visitor4)
      ride2.board_rider(visitor4)
      ride2.board_rider(visitor4)
      ride2.board_rider(visitor4)
      ride2.board_rider(visitor4)
      ride2.board_rider(visitor4) 
      
      ride3.board_rider(visitor3)
      ride3.board_rider(visitor4)
      
      expect(carnival.most_profitable_ride).to eq(ride2)
    end 
  end

  describe "total_revenue" do 
    it "returns the total revenue for the carnival of all based on ride revenue" do 
      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      carnival.add_ride(ride3)

      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor3.add_preference(:gentle)
      visitor4.add_preference(:gentle)
      visitor3.add_preference(:thrilling)
      visitor4.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)

      ride2.board_rider(visitor1)
      ride2.board_rider(visitor2)
      ride2.board_rider(visitor4)

      ride3.board_rider(visitor3)
      ride3.board_rider(visitor4)
      # require 'pry';binding.pry
      expect(carnival.total_revenue).to eq(21)
    end 
  end

  xdescribe "total_revenues" do
    it "return the revenues of all carnivals" do 
      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      carnival.add_ride(ride3)

      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor3.add_preference(:gentle)
      visitor4.add_preference(:gentle)
      visitor3.add_preference(:thrilling)
      visitor4.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)

      ride2.board_rider(visitor1)
      ride2.board_rider(visitor2)
      ride2.board_rider(visitor4)

      ride3.board_rider(visitor3)
      ride3.board_rider(visitor4)
      # require 'pry';binding.pry
      expect(carnival.total_revenue).to eq(21)

      #new carnival, minimal rides just to test class method
      carnival_2.add_ride(ride4)
      carnival_2.add_ride(ride5)

      ride4.board_rider(visitor4)
      ride5.board_rider(visitor4)

      expect(carnival_2.total_revenue).to eq(15)
      exepct(Carnival.total_revenues).to eq(36)
    end
  end
end