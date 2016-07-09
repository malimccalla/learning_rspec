require 'car'

describe 'Car' do

  describe 'attributes' do

    let(:car) { Car.new } #when car is used its calling the helper method car which runs that block of code
    # let is bbetter than before for setting up instance variables
    # before(:example) do
    #   @car = Car.new
    # end

    it "allows reading and writing for :make" do
      car.make = 'Test'
      expect(car.make).to eq('Test')
    end

    it "allows reading and writing for :year" do
      #skip("Testing skipping this test.")
      car.year = 9999
      expect(car.year).to eq(9999)
    end

    it "allows reading and writing for :color" do
      car.color = "foo"
      expect(car.color).to eq("foo")
    end

    it "allows reading for :wheels" do
      expect(car.wheels).to eq(4)
    end

  end

  describe '.colors' do
    let(:c) {['blue', 'black', 'red', 'green']}

    it "it returns an array of color names" do
      expect(Car.colors).to match_array(c)
    end

  end

  describe '#full_name' do
    let(:honda) {Car.new(make: 'Honda', year: 2016, color: 'blue')}
    let(:car) {Car.new}
    
    it "returns a string in the expected format" do
      expect(honda.full_name).to eq('2016 Honda (blue)')
    end

    context "when initialized with no arguments" do
      it "returns a string using default values" do
        car = Car.new
        expect(car.full_name).to eq("2016 Volvo (unknown)")
      end
    end

  end

end
