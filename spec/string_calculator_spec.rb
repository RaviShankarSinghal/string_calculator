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
  end
end
