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

      expect('foo').to be_truthy # anything that isnt false or nil will be considered truthy

      expect(nil).to be_falsey
      expect(0).not_to be_falsey # 0 is still not falsey enough
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

  describe 'numeric comparision matchers' do

    it 'will match less than/greater than' do
      expect(10).to be > 9
      expect(10).to be < 11
      expect(10).to be <= 10
      expect(10).to be >= 10
    end

    it 'will match numberic ranges' do
      expect(10).to be_between(5,10).inclusive
      expect(10).not_to be_between(5,10).exclusive
      expect(10).to be_within(1).of(11)
      expect(5..10).to cover(10)
      expect(5...10).not_to cover(10)
    end

  end

  describe 'collection matchers' do

    it 'will match arrays' do
      array = [1,2,3]

      expect(array).to include(3)
      expect(array).to include(1,3)

      expect(array).to start_with(1)
      expect(array).to end_with(3)

      expect(array).to match_array([3,2,1]) #same elements any order
      expect(array).not_to match_array([1,2])

      expect(array).to contain_exactly(3,2,1) #exactly what the arr contains, any order
      expect(array).not_to contain_exactly(1,2)

    end

    it 'will match strings' do
      string = "Mali"

      expect(string).to include("al")
      expect(string).not_to include("Mli") #has to be in order
      expect(string).to start_with("Ma")
      expect(string).to end_with("li")

    end

    it 'will match hashes' do
      hash = {name: "Mali", age: 23}

      expect(hash).to include(:name)
      expect(hash).not_to include("Mali") #cant search by value
      expect(hash).to include(name: "Mali") # can search by both

    end

  end

  describe 'other usful matchers' do

    it 'will match a string with regular expression' do
      expect("Mali").to match(/[A-Za-z]/)
      expect("someone@example.com").to match(/^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/) #regex for valid email
    end

    it 'will match object types' do
      expect("Hello").to be_a(String)
      expect("Hello").to be_an_instance_of(String)
      expect([1,2,3]).to be_an(Array)
    end

    it 'will match objects with #respond_to' do
      string ='test'
      expect(string).to respond_to(:length)
      expect(string).not_to respond_to(:sort)
    end

    it 'will match class instances with #have_attribute' do
      class Car
        attr_accessor :make, :year
      end
      car = Car.new
      car.make = 'VW'
      car.year = 2016

      expect(car).to have_attributes(make: 'VW')
      expect(car).to have_attributes(make: 'VW', year: 2016)
    end

    it 'will match anything with #satisfy' do
      #this is the most flexible matcher
      expect(10).to satisfy do |value|
        (value >= 5) && (value <= 10) && (value.even?)
      end
    end

  end

end
