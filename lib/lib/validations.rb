class Validations
  def initialize
  end
  def validate_array_values x
    return x.to_i != 0 ? true : false
  end
  def validate_coordinates x
    return x.to_i.is_a?(Numeric) ? true : false
  end
  def validate_coordinates_value x
  end
end
