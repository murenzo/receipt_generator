# frozen_string_literal: true

require_relative '../../../lib/receipt_generator/cart'
require_relative '../../../lib/receipt_generator/cart_item'
require_relative '../../../lib/receipt_generator/products/local/book'
require_relative '../../../lib/receipt_generator/products/local/chocolate_bar'
require_relative '../../../lib/receipt_generator/products/local/music_cd'
require_relative '../../../lib/receipt_generator/till'

RSpec.describe ReceiptGenerator::Till do
  context '#total_cost' do
    it 'returns the correct total amount plus applicable tax' do
      book = ReceiptGenerator::Products::Local::Book.new(name: 'Book', price: 12.49)
      music_cd = ReceiptGenerator::Products::Local::MusicCd.new(name: 'Music CD', price: 14.99)
      chocolate_bar = ReceiptGenerator::Products::Local::ChocolateBar.new(name: 'Chocolate Bar', price: 0.85)
      book_cart_item = ReceiptGenerator::CartItem.new(product: book, quantity: 2)
      music_cd_cart_item = ReceiptGenerator::CartItem.new(product: music_cd, quantity: 1)
      chocolate_cart_item = ReceiptGenerator::CartItem.new(product: chocolate_bar, quantity: 1)
      cart = ReceiptGenerator::Cart.new.add_items(book_cart_item, music_cd_cart_item, chocolate_cart_item)
      till = ReceiptGenerator::Till.new(cart)

      require 'pry'
      binding.pry

      till.calculate_cart_items


      expect(cart_item.subtotal).to eq(30.00)
    end
  end
end
