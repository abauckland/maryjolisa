require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test "provides default retail_subdomain if none set" do
    company = Company.new(subdomain: "cookieshq")

    assert_equal "cookieshq-store", company.retail_subdomain
  end

  test "doesn't override retail_subdomain if set" do
    company = Company.new(retail_subdomain: "cookieshq-shop")

    assert_equal "cookieshq-shop", company.retail_subdomain
  end
end
