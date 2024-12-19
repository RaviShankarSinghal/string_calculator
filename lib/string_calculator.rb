# frozen_string_literal: true

# Returns the addition of the given string
class StringCalculator
  def add(num_string)
    return 0 if num_string.empty?

    numbers_array = split_numbers(num_string, ',')

    numbers_array
      .map(&:to_i)
      .sum
  end

  private

  def split_numbers(numbers_str, delimiter)
    numbers_str.split(delimiter)
  end
end
