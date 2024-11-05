# frozen_string_literal: true

require_relative '../../../../lib/receipt_generator/products/base_product'

RSpec.describe ReceiptGenerator::Products::BaseProduct do
  let(:base_product) { described_class.new(name: 'Product Name', price: 13) }

  context '#initialize' do
    it 'has a name set' do
      expect(base_product.name).to eq('Product Name')
    end

    it 'has a price set' do
      expect(base_product.price).to eq(13)
    end
  end
end
