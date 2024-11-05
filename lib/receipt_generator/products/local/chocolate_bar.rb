# frozen_string_literal: true

require_relative '../base_product'

module ReceiptGenerator
  module Products
    module Local
      class ChocolateBar < Products::BaseProduct
        def base_sales_tax_exempted?
          true
        end

        def charge_import_duty?
          false
        end
      end
    end
  end
end
