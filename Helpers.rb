module Helpers

  def self.get_test_params test_case
    test_case[0..-2].split(':')
  end

end
