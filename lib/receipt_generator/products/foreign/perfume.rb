# frozen_string_literal: true

require_relative '../base_product'

module ReceiptGenerator
  module Products
    module Foreign
      class Perfume < Products::BaseProduct
        def base_sales_tax_exempted?
          false
        end

        def charge_import_duty?
          true
        end
      end
    end
  end
end