# frozen_string_literal: true

# Returns the addition of the given string
class StringCalculator
  def add(num_string)
    return 0 if num_string.empty?

    numbers_array = split_numbers(num_string, ',')
    validate_negatives!(numbers_array)

    numbers_array
      .map(&:to_i)
      .select { |n| n <= 1000 }
      .sum
  end

  private

  def split_numbers(numbers_str, delimiter)
    numbers_str.split(delimiter)
  end

  def validate_negatives!(numbers)
    negatives = numbers.map(&:to_i).select(&:negative?)
    return unless negatives.any?

    raise "negatives not allowed: #{negatives.join(', ')}"
  end
end
