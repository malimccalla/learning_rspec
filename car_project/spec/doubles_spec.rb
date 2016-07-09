describe 'Doubles' do

  let(:dbl) {double("Chant")}

  it 'allows stubbing methods' do
    allow(dbl).to receive(:hey!)
    expect(dbl).to respond_to(:hey!)
  end

  it 'allows stubbing a response with a block' do
    allow(dbl).to receive(:hey!) {"Ho!"} #when i say hey you say ho!
    expect(dbl.hey!).to eq("Ho!")
  end

  it 'allows stubbing responses with #and_return' do
    allow(dbl).to receive(:hey!).and_return("Ho!")
  end

  it 'allows stubbing multiple responses with #and_return' do
    die = double("Die")
    allow(die).to receive(:roll).and_return(1,5,2,6)
    expect(die.roll).to eq(1)
    expect(die.roll).to eq(5)
    expect(die.roll).to eq(2)
    expect(die.roll).to eq(6)
    expect(die.roll).to eq(6) #continues returning last value
  end

end
