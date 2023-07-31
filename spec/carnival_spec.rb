require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do 
  let(:ride1) { Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle }) }
  let(:ride2) { Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle }) }
  let(:ride3) { Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling }) }
  let(:visitor1) { Visitor.new('Bruce', 54, '$10') }
  let(:visitor2) { Visitor.new('Tucker', 36, '$5') }
  let(:visitor3) { Visitor.new('Penny', 64, '$15') }
  let(:carnival) {  Carnival.new(14)}

  describe "it exists and has attributes" do 
    it{ expect(carnival).to be_a Carnival }
    it{ expect(carnival.duration).to eq(14) }
    it{ expect(carnival.rides).to eq([]) }
  end
end