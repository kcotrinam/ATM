class User
  def initialize
    @accounts = {
      kevin: 123_456,
      michael: 654_321
    }
  end

  def valid_information?(account, password)
    result = []
    @accounts.each do |k, v|
      result << true if k.to_s == account && v.to_s == password
    end
    result.all?(true) && result.any? ? true : false
  end
end
