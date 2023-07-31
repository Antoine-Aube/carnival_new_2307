require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do 
  let(:ride1) { Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle }) }
  let(:ride2) { Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle }) }
  let(:ride3) { Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling }) }
  let(:visitor1) { Visitor.new('Bruce', 54, '$10') }
  let(:visitor2) { Visitor.new('Tucker', 36, '$5') }
  let(:visitor3) { Visitor.new('Penny', 64, '$15') }

  describe "it exists and has attributes" do
    it{expect(ride1).to be_a Ride}
    it{expect(ride1.name).to eq("Carousel")}
    it{expect(ride1.min_height).to eq(24)}
    it{expect(ride1.admission_fee).to eq(1)}
    it{expect(ride1.excitement).to eq(:gentle)}
    it{expect(ride1.total_revenue).to eq(0)}
  end

  describe "board_rider and #ride_log" do 
    it "can board riders and add them to rider log as keys with number of times riden as values" do 
       visitor1.add_preference(:gentle)
       visitor2.add_preference(:gentle)

       ride1.board_rider(visitor1)
       ride1.board_rider(visitor2)
       ride1.board_rider(visitor1)
      # require 'pry';binding.pry
       expect(ride1.rider_log).to eq({visitor1 => 2, visitor2 => 1})
    end
  end
end