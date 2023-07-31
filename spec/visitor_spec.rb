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
    it { expect(visitor1.spending_money).to eq(10) }
    it { expect(visitor1.preferences).to eq([]) }
  end

  describe "#add preference" do 
    it "can add preferences" do
      visitor1.add_preference(:gentle)
      visitor1.add_preference(:thrilling)

      expect(visitor1.preferences).to eq([:gentle, :thrilling])
    end
  end

  describe "#tall_enough?" do 
    it "returns a boolean given an argument of a height requirement" do 
      expect(visitor1.tall_enough?(54)).to eq(true)
      expect(visitor2.tall_enough?(54)).to eq(false)
      expect(visitor3.tall_enough?(54)).to eq(true)
      expect(visitor1.tall_enough?(64)).to eq(false)
    end
  end
end