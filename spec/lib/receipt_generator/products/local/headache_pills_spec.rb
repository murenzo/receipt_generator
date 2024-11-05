# frozen_string_literal: true

require_relative '../../../../../lib/receipt_generator/products/local/headache_pills'

RSpec.describe ReceiptGenerator::Products::Local::HeadachePills do
  let(:base_product) { described_class.new(name: 'Packet of headache pills', price: 9.75) }

  context '#initialize' do
    it 'has a name set' do
      expect(base_product.name).to eq('Packet of headache pills')
    end

    it 'has a price set' do
      expect(base_product.price).to eq(9.75)
    end

    it 'base_sales_tax_exempted? is set to true' do
      expect(base_product.base_sales_tax_exempted?).to be_truthy
    end
  end
end
