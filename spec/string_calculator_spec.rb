require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe '#add' do
    context 'with empty string' do
      it 'returns 0' do
        expect(calculator.add('')).to eq(0)
      end
    end

    context 'with single number' do
      it 'returns the number' do
        expect(calculator.add('1')).to eq(1)
      end
    end

    context 'with two numbers' do
      it 'returns their sum' do
        expect(calculator.add('1,2')).to eq(3)
      end
    end

    context 'with unknown amount of numbers' do
      it 'returns their sum' do
        expect(calculator.add('1,2,3,4,5')).to eq(15)
      end
    end

    context 'with negative numbers' do
      it 'raises an exception with all negative numbers' do
        expect { calculator.add('1,-2,-3,4') }
          .to raise_error('negatives not allowed: -2, -3')
      end
    end

    context 'with numbers bigger than 1000' do
      it 'ignores numbers greater than 1000' do
        expect(calculator.add('2,1001')).to eq(2)
      end
    end

    context 'with new lines between numbers' do
      it 'returns their sum' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'with custom delimiter' do
      it 'returns sum using the specified delimiter' do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'with delimiter of any length' do
      it 'returns sum using the specified delimiter' do
        expect(calculator.add("//[***]\n1***2***3")).to eq(6)
      end
    end

    context 'with multiple delimiters' do
      it 'returns sum using any of the specified delimiters' do
        expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
      end
    end

    context 'with multiple delimiters of varying lengths' do
      it 'returns sum using any of the specified delimiters' do
        expect(calculator.add("//[**][%%%]\n1**2%%%3")).to eq(6)
      end
    end
  end
end
