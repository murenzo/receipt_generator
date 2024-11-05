# frozen_string_literal: true

module ReceiptGenerator
  class ReceiptList
    attr_reader :receipt_items

    def initialize
      @receipt_items = []
    end

    def add_receipt_item(receipt_item)
      receipt_items.append(receipt_item)
    end
  end
end
