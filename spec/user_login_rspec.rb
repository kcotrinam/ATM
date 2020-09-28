require_relative '../lib/user_login'

describe User do
  describe '#valid_information?' do
    it 'returns true if account and password belongs to accounts hash' do
      user = User.new
      expect(user.valid_information?('kevin', '123456')).to eql(true)
    end

    it 'returns true if account and password belongs to accounts hash' do
      user = User.new
      expect(user.valid_information?('michael', '654321')).to eql(true)
    end

    it 'returns true if account and password belongs to accounts hash' do
      user = User.new
      expect(user.valid_information?('michael', '15781')).to eql(false)
    end

    it 'returns true if account and password belongs to accounts hash' do
      user = User.new
      expect(user.valid_information?('valeria', '951357')).to eql(false)
    end
  end
end
