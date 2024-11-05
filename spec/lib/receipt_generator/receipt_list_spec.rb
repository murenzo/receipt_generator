# frozen_string_literal: true

require_relative '../../../lib/receipt_generator/receipt_item'
require_relative '../../../lib/receipt_generator/receipt_list'

RSpec.describe ReceiptGenerator::ReceiptList do
  context '#initialize' do
    it 'has an empty items list' do
      expect(subject.receipt_items).to be_empty
    end
  end

  context '#add_receipt_item' do
    it 'adds a single receipt item to the cart' do
      receipt_item = ReceiptGenerator::ReceiptItem.new(quantity: 4, product_name: 'Book A', total_cost: 14, product_tax: 0)
      subject.add_receipt_item(receipt_item)

      expect(subject.receipt_items.length).to eq(1)
    end
  end
end
