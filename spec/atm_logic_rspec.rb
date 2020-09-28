require_relative '../lib/atm_logic'

describe Atm do
  describe '#display' do
    it 'returns the value of the savings' do
      atm = Atm.new
      expect(atm.display).to eql(1000)
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

  describe '#deposit' do
    it 'return the amount of money that was deposit' do
      atm = Atm.new
      expect(atm.deposit(500)).to eql(1500)
    end

    it 'return the amount of money that was deposit' do
      atm = Atm.new
      expect(atm.deposit(1500)).to eql(2500)
    end
  end

  describe '#valid_deposit?' do
    it 'returns true if the deposit is valid' do
      atm = Atm.new
      expect(atm.valid_deposit?(-500)).to eql(false)
    end
    it 'returns true if the deposit is valid' do
      atm = Atm.new
      expect(atm.valid_deposit?(500)).to eql(true)
    end
  end

  describe '#valid_withdraw?' do
    it 'returns true if the deposit is valid' do
      atm = Atm.new
      expect(atm.valid_withdraw?(500)).to eql(true)
    end
    it 'returns true if the deposit is valid' do
      atm = Atm.new
      expect(atm.valid_withdraw?(250)).to eql(true)
    end
    it 'returns true if the deposit is valid' do
      atm = Atm.new
      expect(atm.valid_withdraw?(1200)).to eql(false)
    end
  end

  describe '#withdraw?' do
    it 'return true if the input is a float' do
      atm = Atm.new
      expect(atm.withdraw(500)).to eql(500)
    end
    it 'return true if the input is a float' do
      atm = Atm.new
      expect(atm.withdraw(900)).to eql(100)
    end
    it 'return true if the input is a float' do
      atm = Atm.new
      expect(atm.withdraw(250)).to eql(750)
    end
  end
end
