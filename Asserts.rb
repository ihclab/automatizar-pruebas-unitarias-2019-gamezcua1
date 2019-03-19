module Asserts
  def self.assertEqual a, b
    a == b
  end

  def self.assertNotEqual a, b
    a != b
  end

  def self.assertTrue x
    x == true
  end

  def self.assertFalse x
    x == false
  end

  def self.assertIsNil x
    x == nil
  end

  def self.assertIsNotNone x
    x != nil
  end

  def self.assertIn a, b
    a.include?(b)
  end

  def self.assertNotIn a, b
    !a.include?(b)
  end

end
