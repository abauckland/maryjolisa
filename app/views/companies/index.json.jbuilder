json.array!(@companies) do |company|
  json.extract! company, :id, :name, :address, :postcode, :tel, :email, :reg_no, :vat_no
  json.url company_url(company, format: :json)
end
