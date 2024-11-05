# frozen_string_literal: true

require_relative '../../../../../lib/receipt_generator/products/local/book'

RSpec.describe ReceiptGenerator::Products::Local::Book do
  let(:base_product) { described_class.new(name: 'Book', price: 12.49) }

  context '#initialize' do
    it 'has a name set' do
      expect(base_product.name).to eq('Book')
    end

    it 'has a price set' do
      expect(base_product.price).to eq(12.49)
    end

    it 'base_sales_tax_exempted? is set to true' do
      expect(base_product.base_sales_tax_exempted?).to be_truthy
    end
  end
end
