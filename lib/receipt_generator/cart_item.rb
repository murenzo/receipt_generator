# frozen_string_literal: true

module ReceiptGenerator
  class CartItem
    attr_reader :product, :quantity

    def initialize(product:, quantity:)
      @product = product
      @quantity = quantity
    end

    def subtotal
      product.price * @quantity
    end
  end
end
