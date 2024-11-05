# frozen_string_literal: true

module ReceiptGenerator
  class ReceiptItem
    attr_reader :quantity, :product_name, :total_cost, :product_tax

    def initialize(quantity:, product_name:, total_cost:, product_tax:)
      @quantity = quantity
      @product_name = product_name
      @total_cost = total_cost
      @product_tax = product_tax
    end

    def to_s
      "#{quantity} #{product_name}: #{total_cost}"
    end
  end
end
