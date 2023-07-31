require './lib/visitor'

RSpec.describe Visitor do 
  let(:visitor1) { Visitor.new('Bruce', 54, '$10') }
  let(:visitor2) { Visitor.new('Tucker', 36, '$5') }
  let(:visitor3) { Visitor.new('Penny', 64, '$15') }

  describe "it exists and has attributes" do 
    it {expect(visitor1).to be_a Visitor}
    it {expect(visitor2).to be_a Visitor}
    it {expect(visitor3).to be_a Visitor}

    it { expect(visitor1.name).to eq("Bruce") }
    it { expect(visitor1.height).to eq(54) }
    it { expect(visitor1.spending_money).to eq('$10') }
    it { expect(visitor1.preferences).to eq([]) }
  end
end