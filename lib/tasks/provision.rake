desc "Provision a store with MYHQ_STORE_COMPANY_ID=<company id>, MYHQ_STORE_USER_ID=<user id>"
task :provision_store => :environment do
  begin
    company = Company.find(ENV["MYHQ_STORE_COMPANY_ID"])
    user    = User.find(ENV["MYHQ_STORE_USER_ID"])

    config = {
      app_domain:                    company.retail_subdomain,
      database_user:                 Company.connection_config[:username],
      database_password:             Company.connection_config[:password],
      devise_secret:                 Devise.secret_key,
      rails_secret:                  Rails.application.secrets[:secret_key_base],
      admin_user_email:              user.email,
      admin_user_encrypted_password: user.encrypted_password,
      admin_user_password_salt:      user.password_salt,

      nginx_restart_cmd:             Rails.env.production? ? "sudo /opt/nginx/sbin/nginx -s reload" : "echo 'nginx restarted'"
    }

    Myhqtemplate.provision_store!(STORES_PATH, config) do
      Rails.logger.info("Provisioning complete for #{user.inspect} at #{company.inspect}")

      StoresMailer.provisioning_complete(company, user).deliver
    end
  rescue => exception
    Rails.logger.error("Error setting up provisioning for #{user.inspect} at #{company.inspect}: #{exception.message}")
    Rails.logger.error("Current ENV: #{ENV.inspect}")

    Bugsnag.notify(exception,
      severity: "error",
      user: {
        id:    user.id,
        email: user.email
      },
      company: {
        id: company.id
      }
    )

    StoresMailer.provisioning_failed(company, user, exception).deliver
  end
end
