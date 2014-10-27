class StoresController < ApplicationController
  before_filter :authenticate_user!
  before_filter :assign_company
  before_filter :check_company_has_no_store_already

  def new

  end

  def create
    if @company.update_attributes(company_params)
      pid = Kernel.spawn("MYHQ_STORE_COMPANY_ID=#{@company.id} bundle exec rake provision_store")
      Process.detach(pid)

      Rails.logger.info("(PID: #{pid}) Started provisioning store for #{@company.inspect}")

      redirect_to dashboards_path, notice: "Your store with the subdomain #{@company.retail_subdomain} is being prepared"
    else
      render :new
    end
  end

  protected

  def assign_company
    @company = Company.find(params[:company_id])
  end

  def company_params
    params.require(:company).permit(:retail_subdomain)
  end

  def check_company_has_no_store_already
    if STORES_PATH.join(@company.retail_subdomain).exist?
      redirect_to(dashboards_path, notice: "You already have a store setup") and return
    end
  end
end
