desc "Provision a store"
task :provision_store => :environment do
  begin
    company = Company.find(ENV["MYHQ_STORE_COMPANY_ID"])
    user    = company.users.first

    config = {
      app_domain:                    company.retail_subdomain,
      database_user:                 Company.connection_config[:username],
      database_password:             Company.connection_config[:password],
      devise_secret:                 Devise.secret_key,
      rails_secret:                  Rails.application.secrets[:secret_key_base],
      admin_user_email:              user.email,
      admin_user_encrypted_password: user.encrypted_password,

      nginx_restart_cmd:             ("sudo /opt/nginx/sbin/nginx -s reload" if Rails.env.production?)
    }

    Myhqtemplate.provision_store!(STORES_PATH, config) do
      Rails.logger.info("Provisioning worked! for #{company.inspect}")
    end
  rescue => e
    Rails.logger.error("Error setting up provisioning: #{e.message}")
    Rails.logger.error("Current ENV: #{ENV.inspect}")
    raise e
  end
end
