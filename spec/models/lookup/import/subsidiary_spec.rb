RSpec.describe Lookup::Import::Subsidiary do
  describe '#table_name' do
    specify { expect(described_class.table_name).to eql('lookup_import_subsidiaries') }
  end

  describe 'validation' do
    it 'is valid with valid attributes' do
      expect(
        described_class.new(fca_number: 123456, name: 'Ben Lovell Ltd')
      ).to be_valid
    end

    describe 'FCA Number rules' do
      it 'accepts numeric' do
        expect(described_class.new(fca_number: '123A45')).to_not be_valid
      end

      it 'accepts only 6 digits' do
        expect(described_class.new(fca_number: 1234567)).to_not be_valid
      end
    end
  end
end
