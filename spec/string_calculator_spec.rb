require 'string_calculator'

RSpec.describe 'StringCalculator' do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(calculator.add('')).to eq(0)
    end

    it 'returns same value for a single length string' do
      expect(calculator.add('1')).to eq(1)
      expect(calculator.add('2')).to eq(2)
    end
  end
end
