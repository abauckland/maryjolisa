class UsersController < ApplicationController
  before_action :set_user, only: [:show, :activate, :deactivate]

  # GET /users
  # GET /users.json
  def index
   # @users = User.all
   # authorize @users    
    @users = policy_scope(User)
    authorize @users
  end

  # GET /companies/1
  # GET /companies/1.json  
  def show  
    #if current_user.company_id == @user.company_id    
    authorize @user   
  end

    def activate
      authorize @user
      if @payment.activate!
        respond_to do |format|
          format.js   { render :activate, :layout => false }
        end 
      end 
    end

    def deactivate
      authorize @user
      if @payment.deactivate!
        respond_to do |format|
          format.js   { render :deactivate, :layout => false }
        end 
      end 
    end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_user
      @user = User.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :surname)
    end      
end
