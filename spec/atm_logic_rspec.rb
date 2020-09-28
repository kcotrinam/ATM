require_relative '../lib/atm_logic'

describe Atm do
  describe '#display' do
    it 'returns the value of the savings' do
      atm = Atm.new
      expect(atm.display).to eql(1000)
    end
  end

  describe '#deposit' do
    it 'return the amount of money that was deposit' do
      atm = Atm.new
      expect(atm.deposit(500)).to eql(true)
    end

    it 'return the amount of money that was deposit' do
      atm = Atm.new
      expect(atm.deposit(-500)).to eql(false)
    end
  end

  describe '#float?' do
    it 'return true if the input is a float' do
      atm = Atm.new
      expect(atm.float?('50.5')).to eql(true)
    end
  end

  describe '#mixed?' do
    it 'return true if the input is a float' do
      atm = Atm.new
      expect(atm.mixed?('5u')).to eql(true)
    end
    it 'return true if the input is a float' do
      atm = Atm.new
      expect(atm.mixed?('a52')).to eql(true)
    end
  end
end
