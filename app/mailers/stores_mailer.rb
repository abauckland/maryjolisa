class StoresMailer < ActionMailer::Base
  helper :application

  def provisioning_complete(company, user)
    @company, @user = company, user

    mail(to: user.email, subject: "Your MyHQ store is ready")
  end

  def provisioning_failed(company, user, exception)
    @company, @user, @exception = company, user, exception

    mail(to: User.admin.pluck(:email), subject: "Error when provisioning store on MyHQ")
  end
end
