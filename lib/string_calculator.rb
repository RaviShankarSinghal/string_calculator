# frozen_string_literal: true

# Returns the addition of the given string
class StringCalculator
  def add(num_string)
    return 0 if num_string.empty?

    delimiter, numbers_str = extract_delimiter(num_string)
    return 0 if numbers_str.empty?

    numbers_array = split_numbers(numbers_str, delimiter)
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

  def extract_delimiter(input)
    if input.start_with?('//')
      delimiter_section = input[2..input.index("\n") - 1]
      numbers = input[input.index("\n") + 1..]
      delimiter = check_delimiter_section(delimiter_section)
      [delimiter, numbers]
    else
      [/[,\n]/, input]
    end
  end

  def check_delimiter_section(delimiter_section)
    if delimiter_section.start_with?('[') && delimiter_section.end_with?(']')
      delimiters = delimiter_section.scan(/\[(.*?)\]/).flatten
      Regexp.union(delimiters)
    else
      delimiter_section
    end
  end
end
