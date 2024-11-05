# frozen_string_literal: true

require_relative '../../../lib/receipt_generator/cart_item'
require_relative '../../../lib/receipt_generator/products/local/book'

RSpec.describe ReceiptGenerator::CartItem do
  context '#subtotal' do
    it 'returns the correct subtotal amount based on the product price * quantity' do
      book = ReceiptGenerator::Products::Local::Book.new(name: 'Book A', price: 10.00)
      cart_item = ReceiptGenerator::CartItem.new(product: book, quantity: 3)

      expect(cart_item.subtotal).to eq(30.00)
    end
  end
end
