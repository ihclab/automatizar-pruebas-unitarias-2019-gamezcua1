module Helpers

  def self.get_test_params test_case
    test_case[0..-2].split(':')
  end

  def self.get_values values
    values.split(' ').map(&:to_i)
  end

  def self.result_to_double result
    result.to_f
  end

end
