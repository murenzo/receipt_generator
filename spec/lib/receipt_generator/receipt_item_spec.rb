# frozen_string_literal: true

require_relative '../../../lib/receipt_generator/receipt_item'
require_relative '../../../lib/receipt_generator/products/local/book'

RSpec.describe ReceiptGenerator::ReceiptItem do
  let(:quantity) { 4 }
  let(:product_name) { 'Book A' }
  let(:total_cost) { 14 }
  let(:product_tax) { 0 }
  let(:subject) { described_class.new(quantity:, product_name:, total_cost:, product_tax:) }

  context '#initialize' do
    it 'sets all the required attributes' do
      expect(subject.quantity).to eq(quantity)
      expect(subject.product_name).to eq(product_name)
      expect(subject.total_cost).to eq(total_cost)
      expect(subject.product_tax).to eq(0)
    end
  end

  context '#to_s' do
    it 'prints out product details in this format' do
      expected_output = "#{quantity} #{product_name}: #{total_cost}"
      expect(subject.to_s).to eq(expected_output)
    end
  end
end
