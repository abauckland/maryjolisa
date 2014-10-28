class StoresMailer < ActionMailer::Base
  helper :application

  def provisioning_complete(company, user)
    @company, @user = company, user

    mail(to: user.email, subject: "Your MyHQ store is ready")
  end
end
