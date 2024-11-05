# frozen_string_literal: true

require_relative '../../../../../lib/receipt_generator/products/foreign/chocolate_box'

RSpec.describe ReceiptGenerator::Products::Foreign::ChocolateBox do
  let(:base_product) { described_class.new(name: 'Imported box of chocolates', price: 10.00) }

  context '#initialize' do
    it 'has a name set' do
      expect(base_product.name).to eq('Imported box of chocolates')
    end

    it 'has a price set' do
      expect(base_product.price).to eq(10.00)
    end

    it 'base_sales_tax_exempted? is set to true' do
      expect(base_product.base_sales_tax_exempted?).to be_truthy
    end

    it 'charge_import_duty? is set to true' do
      expect(base_product.charge_import_duty?).to be_truthy
    end
  end
end
