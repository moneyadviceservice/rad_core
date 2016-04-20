RSpec.describe Lookup::Import::Adviser do
  describe '#table_name' do
    specify { expect(described_class.table_name).to eql('lookup_import_advisers') }
  end

  describe 'validation' do
    it 'is valid with valid attributes' do
      expect(
        described_class.new(reference_number: 'ABC12345', name: 'Miss Adviser')
      ).to be_valid
    end

    it 'is invalid without a name' do
      expect(
        described_class.new(reference_number: 'ABC12345', name: nil)
      ).to be_invalid
    end

    describe 'FCA Number rules' do
      it 'does not accept numeric' do
        expect(described_class.new(reference_number: 12345678)).to_not be_valid
      end

      it 'accepts only 8 characters' do
        expect(described_class.new(reference_number: '123456789')).to_not be_valid
      end
    end
  end
end
