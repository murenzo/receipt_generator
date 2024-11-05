# frozen_string_literal: true

require_relative '../../../lib/receipt_generator/cart'
require_relative '../../../lib/receipt_generator/cart_item'
require_relative '../../../lib/receipt_generator/products/local/book'

RSpec.describe ReceiptGenerator::Cart do
  context '#initialize' do
    it 'has an empty items list' do
      expect(subject.items).to be_empty
    end
  end

  context '#add_item' do
    it 'adds a single cart item to the cart' do
      book = ReceiptGenerator::Products::Local::Book.new(name: 'Book A', price: 10.00)
      cart_item = ReceiptGenerator::CartItem.new(product: book, quantity: 3)
      subject.add_item(cart_item)

      expect(subject.items.length).to eq(1)
    end
  end

  context '#add_items' do
    it 'adds multiple cart items to the cart' do
      book1 = ReceiptGenerator::Products::Local::Book.new(name: 'Book A', price: 10.00)
      book2 = ReceiptGenerator::Products::Local::Book.new(name: 'Book B', price: 11.00)
      cart_item1 = ReceiptGenerator::CartItem.new(product: book1, quantity: 3)
      cart_item2 = ReceiptGenerator::CartItem.new(product: book2, quantity: 2)
      subject.add_items(cart_item1, cart_item2)

      expect(subject.items.length).to eq(2)
    end
  end
end
