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

  [:subdomain, :retail_subdomain].each do |field|
    test "allows letters and dashes in #{field}" do
      company = Company.new(field => "cookies-hq")

      company.valid?

      assert_empty company.errors[field]
    end

    test "allows uppercase letters in #{field} (but downcases them)" do
      company = Company.new(field => "COOKIES-hq")

      company.valid?

      assert_empty company.errors[field]
    end

    test "disallows numbers in #{field}" do
      company = Company.new(field => "cookies1")

      company.valid?

      assert_includes company.errors[field], "can only contain letters and dashes"
    end
  end

  test "subdomain must be unique" do
    new_company = Company.new(subdomain: companies(:one).subdomain)

    new_company.valid?

    assert_includes new_company.errors[:subdomain], I18n.t("errors.messages.taken")
  end

  test "subdomain must be unique (including retail_subdomain)" do
    new_company = Company.new(subdomain: companies(:one).retail_subdomain)

    new_company.valid?

    assert_includes new_company.errors[:subdomain], I18n.t("errors.messages.taken")
  end

  test "retail_subdomain must be unique" do
    new_company = Company.new(retail_subdomain: companies(:one).retail_subdomain)

    new_company.valid?

    assert_includes new_company.errors[:retail_subdomain], I18n.t("errors.messages.taken")
  end

  test "retail_subdomain must be unique (including subdomain)" do
    new_company = Company.new(retail_subdomain: companies(:one).subdomain)

    new_company.valid?

    assert_includes new_company.errors[:retail_subdomain], I18n.t("errors.messages.taken")
  end

  [:subdomain, :retail_subdomain].each do |field|
    test "#{field} cannot be changed once set" do
      company = companies(:one)
      company.assign_attributes(field => "new-#{field}")

      company.valid?

      assert_includes company.errors[field], "cannot be changed"
    end

    test "#{field} can be set for new records" do
      company = companies(:one).dup
      company.assign_attributes(field => "new-#{field}")

      company.valid?

      refute_includes company.errors[field], "cannot be changed"
    end
  end
end
