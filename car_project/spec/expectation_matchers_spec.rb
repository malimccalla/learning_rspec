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

end
