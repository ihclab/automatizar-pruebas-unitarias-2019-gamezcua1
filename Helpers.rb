module Helpers

  def self.get_test_params test_case
    test_case[0..-2].split(':')
  end

  def self.get_values values
    if values == "NULL"
      return nil
    end
    values.split(' ').map(&:to_i)
  end

  def self.result_to_double result
    result.to_f
  end

end

class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

end
