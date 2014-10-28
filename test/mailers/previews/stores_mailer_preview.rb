class StoresMailerPreview < ActionMailer::Preview
  def provisioning_complete
    company = Company.first

    StoresMailer.provisioning_complete(company, company.users.first)
  end
end
