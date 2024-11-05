# frozen_string_literal: true

require_relative '../../../../../lib/receipt_generator/products/foreign/perfume'

RSpec.describe ReceiptGenerator::Products::Foreign::Perfume do
  let(:base_product) { described_class.new(name: 'Imported bottle of perfume', price: 47.50) }

  context '#initialize' do
    it 'has a name set' do
      expect(base_product.name).to eq('Imported bottle of perfume')
    end

    it 'has a price set' do
      expect(base_product.price).to eq(47.50)
    end

    it 'base_sales_tax_exempted? is set to false' do
      expect(base_product.base_sales_tax_exempted?).to be_falsy
    end

    it 'charge_import_duty? is set to true' do
      expect(base_product.charge_import_duty?).to be_truthy
    end
  end
end
