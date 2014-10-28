class StoresMailerPreview < ActionMailer::Preview
  def provisioning_complete
    company = Company.first

    StoresMailer.provisioning_complete(company, company.users.first)
  end

  def provisioning_failed
    company = Company.first

    StoresMailer.provisioning_failed(company, company.users.first, manufacture_exception_with_backtrace)
  end

  private

  def manufacture_exception_with_backtrace
    raise "A test error"
  rescue => exception
    exception
  end
end
