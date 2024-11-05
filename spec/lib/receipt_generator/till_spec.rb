# frozen_string_literal: true

require_relative '../../../lib/receipt_generator/cart'
require_relative '../../../lib/receipt_generator/cart_item'
require_relative '../../../lib/receipt_generator/products/foreign/chocolate_box'
require_relative '../../../lib/receipt_generator/products/foreign/perfume'
require_relative '../../../lib/receipt_generator/products/local/book'
require_relative '../../../lib/receipt_generator/products/local/chocolate_bar'
require_relative '../../../lib/receipt_generator/products/local/music_cd'
require_relative '../../../lib/receipt_generator/till'

RSpec.describe ReceiptGenerator::Till do
  context '#calculate_cart_items' do
    context 'when local product with basic sales tax exemption' do
      let(:book) { ReceiptGenerator::Products::Local::Book.new(name: 'Book', price: 12.49) }
      let(:book_cart_item) { ReceiptGenerator::CartItem.new(product: book, quantity: 2) }
      let(:cart) { ReceiptGenerator::Cart.new.add_item(book_cart_item) }

      it 'does not apply tax to the product total cost' do
        receipt_items = ReceiptGenerator::Till.new(cart).calculate_cart_items
        book_receipt_item = receipt_items.first

        expect(book_receipt_item.product_tax).to eq(0)
        expect(book_receipt_item.total_cost).to eq(24.98)
      end
    end

    context 'when local product with no basic sales tax exemption' do
      let(:music_cd) { ReceiptGenerator::Products::Local::MusicCd.new(name: 'Music CD', price: 14.99) }
      let(:music_cd_cart_item) { ReceiptGenerator::CartItem.new(product: music_cd, quantity: 1) }
      let(:cart) { ReceiptGenerator::Cart.new.add_item(music_cd_cart_item) }

      it 'only applies basic sales tax to the product total cost' do
        receipt_items = ReceiptGenerator::Till.new(cart).calculate_cart_items
        music_cd_receipt_item = receipt_items.first

        expect(music_cd_receipt_item.product_tax).to eq(1.5)
        expect(music_cd_receipt_item.total_cost).to eq(16.49)
      end
    end

    context 'when imported product with basic sales tax exemption' do
      let(:chocolate_box) { ReceiptGenerator::Products::Foreign::ChocolateBox.new(name: 'Imported box of chocolates', price: 10.00) }
      let(:chocolate_box_cart_item) { ReceiptGenerator::CartItem.new(product: chocolate_box, quantity: 1) }
      let(:cart) { ReceiptGenerator::Cart.new.add_item(chocolate_box_cart_item) }

      it 'only applies import duty tax to the product total cost' do
        receipt_items = ReceiptGenerator::Till.new(cart).calculate_cart_items
        chocolate_box_receipt_item = receipt_items.first

        expect(chocolate_box_receipt_item.product_tax).to eq(0.5)
        expect(chocolate_box_receipt_item.total_cost).to eq(10.5)
      end
    end

    context 'when imported product with no basic sales tax exemption' do
      let(:perfume) { ReceiptGenerator::Products::Foreign::Perfume.new(name: 'Imported bottle of perfume', price: 27.99) }
      let(:perfume_cart_item) { ReceiptGenerator::CartItem.new(product: perfume, quantity: 1) }
      let(:cart) { ReceiptGenerator::Cart.new.add_item(perfume_cart_item) }

      it 'applies both basic sales and import duty tax to the product total cost' do
        receipt_items = ReceiptGenerator::Till.new(cart).calculate_cart_items
        perfume_receipt_item = receipt_items.first

        expect(perfume_receipt_item.product_tax).to eq(4.2)
        expect(perfume_receipt_item.total_cost).to eq(32.19)
      end
    end
  end
end
