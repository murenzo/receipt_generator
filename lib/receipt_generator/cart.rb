# frozen_string_literal: true

module ReceiptGenerator
  class Cart
    attr_reader :items

    def initialize
      @items = []
    end

    def add_item(cart_item)
      items.append(cart_item)
    end

    def add_items(*cart_items)
      items.append(*cart_items)
    end
  end
end
