# frozen_string_literal: true

require_relative '../../../../../lib/receipt_generator/products/local/chocolate_bar'

RSpec.describe ReceiptGenerator::Products::Local::ChocolateBar do
  let(:base_product) { described_class.new(name: 'Chocolate bar', price: 0.85) }

  context '#initialize' do
    it 'has a name set' do
      expect(base_product.name).to eq('Chocolate bar')
    end

    it 'has a price set' do
      expect(base_product.price).to eq(0.85)
    end

    it 'base_sales_tax_exempted? is set to true' do
      expect(base_product.base_sales_tax_exempted?).to be_truthy
    end
  end
end
