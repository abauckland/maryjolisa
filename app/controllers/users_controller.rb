class UsersController < ApplicationController


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
    @user = User.find(params[:id])
    authorize @user   
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :surname)
    end      
end
