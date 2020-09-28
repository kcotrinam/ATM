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
end
