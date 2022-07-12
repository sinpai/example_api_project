require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'should have a positive price' do
    product = Product.create(title: "pr#{rand}", price: -1)
    assert_not product.valid?
  end
end
