# frozen_string_literal: true

module ReceiptGenerator
  module Products
    class BaseProduct
      attr_reader :name, :price

      def initialize(name:, price:)
        @name = name
        @price = price
      end

      def base_sales_tax_exempted?
        raise NotImplementedError, 'Implement this method in a subclass'
      end

      def charge_import_duty?
        raise NotImplementedError, 'Implement this method in a subclass'
      end
    end
  end
end
