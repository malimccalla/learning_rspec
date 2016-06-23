describe 'Expectation Matchers' do

  describe 'equivalence matchers' do

    it 'will match loose equality with #eq' do
      a = '2 cats'
      b = '2 cats'
      expect(a).to eq(b)
      expect(a).to be == b # synonym for #eq

      c = 17
      d = 17.0
      expect(c).to eq(d) #difference types, but "close enough"
    end

    it 'will match value equality with #eql' do
      a = '2 cats'
      b = '2 cats'
      expect(a).to eql(b) #stricter than #eq

      c = 17
      d = 17.0
      expect(c).not_to eql(d) #not the same, close doesnt count
    end

    it 'will match object identity with #equal' do
      a = '2 cats'
      b = '2 cats'
      expect(a).not_to equal(b) #same value different object

      c = b
      expect(b).to equal(c) #same object
      expect(b).to be(c)    #synonym for #equal
    end
  end

  describe 'truthiness matchers' do

    it 'will match true/false' do
      expect(1 < 2).to be(true)
      expect(1 > 2).to be(false)

      expect('foo').not_to be(true) #the string does not have the true object id
      expect(nil).not_to be(false) #nil is not false
      expect(0).not_to be(false) #0 is not false
    end

    it 'will match truthy/falsey' do
      expect(1 < 2).to be_truthy
      expect(1 > 2).to be_falsey

      expect('foo').to be_truthy

      expect(nil).to be_falsey
      expect(0).not_to be_falsey
    end

    it 'will match nil' do
      expect(nil).to be_nil
      expect(nil).to be(nil)

      expect(false).not_to be(nil)
      expect(false).not_to be_nil

      expect(0).not_to be_nil
      expect(0).not_to be(nil)
    end

  end

end
