# frozen_string_literal: true

require_relative '../../../../../lib/receipt_generator/products/local/perfume'

RSpec.describe ReceiptGenerator::Products::Local::Perfume do
  let(:base_product) { described_class.new(name: 'Bottle of perfume', price: 18.99) }

  context '#initialize' do
    it 'has a name set' do
      expect(base_product.name).to eq('Bottle of perfume')
    end

    it 'has a price set' do
      expect(base_product.price).to eq(18.99)
    end

    it 'base_sales_tax_exempted? is set to false' do
      expect(base_product.base_sales_tax_exempted?).to be_falsy
    end
  end
end
