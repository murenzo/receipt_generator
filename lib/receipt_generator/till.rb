# frozen_string_literal: true

require_relative './receipt_item'
require_relative './receipt_list'
require_relative './tax_calculator'

module ReceiptGenerator
  class Till
    attr_reader :cart

    def initialize(cart)
      @cart = cart
      @receipt_list = ReceiptGenerator::ReceiptList.new
    end

    def calculate_cart_items
      cart.map do |cart_item|
        receipt_item = generate_receipt_item(cart_item)
        @receipt_list.add_receipt_item(receipt_item)
      end

      display_and_return_receipt_items
    end

    private

    def display_and_return_receipt_items
      display_receipt

      @receipt_list.receipt_items
    end

    def display_receipt
      print_receipt_list
      print_sales_taxes
      print_cart_total
    end

    def print_receipt_list
      @receipt_list.receipt_items.each do |receipt_item|
        puts receipt_item
      end
    end

    def print_sales_taxes
      puts "Sales Taxes: #{@receipt_list.receipt_items.map(&:product_tax).sum.round(2)}"
    end

    def print_cart_total
      puts "Total #{@receipt_list.receipt_items.map(&:total_cost).sum.round(2)}"
    end

    def generate_receipt_item(cart_item)
      product_tax = ReceiptGenerator::TaxCalculator.calculate(cart_item.product)

      ReceiptGenerator::ReceiptItem.new(
        quantity: cart_item.quantity,
        product_name: cart_item.product.name,
        total_cost: (product_tax + cart_item.subtotal).round(2),
        product_tax:
      )
    end
  end
end
