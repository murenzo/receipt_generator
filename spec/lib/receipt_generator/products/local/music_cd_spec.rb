# frozen_string_literal: true

require_relative '../../../../../lib/receipt_generator/products/local/music_cd'

RSpec.describe ReceiptGenerator::Products::Local::MusicCd do
  let(:base_product) { described_class.new(name: 'Music CD', price: 14.99) }

  context '#initialize' do
    it 'has a name set' do
      expect(base_product.name).to eq('Music CD')
    end

    it 'has a price set' do
      expect(base_product.price).to eq(14.99)
    end

    it 'base_sales_tax_exempted? is set to false' do
      expect(base_product.base_sales_tax_exempted?).to be_falsy
    end
  end
end
