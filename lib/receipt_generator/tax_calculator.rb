# frozen_string_literal: true

module ReceiptGenerator
  class TaxCalculator
    attr_reader :product_tax

    BASIC_SALES_TAX = 0.1
    IMPORT_DUTY_TAX = 0.05

    def self.calculate(product)
      product_tax = 0
      product_tax += apply_basic_sales_tax(product) unless product.base_sales_tax_exempted?
      product_tax += apply_import_duty_tax(product) if product.charge_import_duty?

      product_tax.round(2)
    end

    def self.apply_basic_sales_tax(product)
      BASIC_SALES_TAX * product.price
    end

    def self.apply_import_duty_tax(product)
      IMPORT_DUTY_TAX * product.price
    end
  end
end
