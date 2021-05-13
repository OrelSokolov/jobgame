describe Field do

  context "Default 1x1" do
    it "should allow position 0, 0" do
      expect(subject.position_allowed?(0, 0)).to be_truthy
    end

    it "should disallow negative position" do
      expect(subject.position_allowed?(-1, -1)).to be_falsey
    end

    it "should disallow position 1, 1" do
      expect(subject.position_allowed?(1, 1)).to be_falsey
    end

    it "should disallow position 1, 0" do
      expect(subject.position_allowed?(1, 0)).to be_falsey
    end

  end

  context "5x5" do

    subject {Field.new(5, 5)}

    it "should allow position 4, 4" do
      expect(subject.position_allowed?(4, 4)).to be_truthy
    end

    it "should disallow negative position" do
      expect(subject.position_allowed?(-1, -1)).to be_falsey
    end

    it "should allow position 10, 4" do
      expect(subject.position_allowed?(10, 4)).to be_falsey
    end

  end
end