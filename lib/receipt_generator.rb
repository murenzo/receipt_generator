# frozen_string_literal: true

# Load foreign products
require_relative './receipt_generator/products/foreign/chocolate_box'
require_relative './receipt_generator/products/foreign/perfume'

# Load local products
require_relative './receipt_generator/products/local/book'
require_relative './receipt_generator/products/local/chocolate_bar'
require_relative './receipt_generator/products/local/headache_pills'
require_relative './receipt_generator/products/local/music_cd'
require_relative './receipt_generator/products/local/perfume'

require_relative './receipt_generator/cart_item'
require_relative './receipt_generator/cart'
require_relative './receipt_generator/receipt_item'
require_relative './receipt_generator/receipt_list'
require_relative './receipt_generator/till'

# Setting up sample products
book = ReceiptGenerator::Products::Local::Book.new(name: 'Book', price: 12.49)
music_cd = ReceiptGenerator::Products::Local::MusicCd.new(name: 'Music CD', price: 14.99)
foreign_perfume = ReceiptGenerator::Products::Foreign::Perfume.new(name: 'Imported bottle of perfume', price: 27.99)

# Add the products that was setup above into their respective cart items
book_cart_item = ReceiptGenerator::CartItem.new(product: book, quantity: 2)
music_cd_cart_item = ReceiptGenerator::CartItem.new(product: music_cd, quantity: 1)
foreign_perfume_cart_item = ReceiptGenerator::CartItem.new(product: foreign_perfume, quantity: 1)

# Add the above cart items to the cart
cart = ReceiptGenerator::Cart.new.add_items(book_cart_item, music_cd_cart_item, foreign_perfume_cart_item)

# Send the cart to the till to calculate the total amount to be paid and display
ReceiptGenerator::Till.new(cart).calculate_cart_items
