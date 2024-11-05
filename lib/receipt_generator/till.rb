# frozen_string_literal: true

require_relative './receipt_item'
require_relative './receipt_list'

module ReceiptGenerator
  class Till
    attr_reader :cart

    BASIC_SALES_TAX = 0.1
    IMPORT_DUTY_TAX = 0.05

    def initialize(cart)
      @cart = cart
      @receipt_list = ReceiptGenerator::ReceiptList.new
    end

    def calculate_cart_items
      cart.map do |cart_item|
        receipt_item = generate_receipt_item(cart_item)
        @receipt_list.add_receipt_item(receipt_item)
      end

      display_receipt
    end

    private

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
      puts "Sales Taxes: #{(@receipt_list.receipt_items.map(&:product_tax).sum).round(2)}"
    end

    def print_cart_total
      puts "Total #{(@receipt_list.receipt_items.map(&:total_cost).sum).round(2)}"
    end

    # def reception_list
    #   @reception_list ||= ReceiptGenerator::ReceptionList.new
    # end

    def generate_receipt_item(cart_item)
      product_tax = calculate_product_taxes(cart_item.product)

      ReceiptGenerator::ReceiptItem.new(
        quantity: cart_item.quantity,
        product_name: cart_item.product.name,
        total_cost: (product_tax + cart_item.subtotal).round(2),
        product_tax:
      )
    end

    def calculate_product_taxes(product)
      product_total_cost = 0
      product_total_cost += apply_basic_sales_tax(product) unless product.base_sales_tax_exempted?
      product_total_cost += apply_import_duty_tax(product) if product.charge_import_duty?

      product_total_cost
    end

    def apply_basic_sales_tax(product)
      BASIC_SALES_TAX * product.price
    end

    def apply_import_duty_tax(product)
      IMPORT_DUTY_TAX * product.price
    end
  end
end
