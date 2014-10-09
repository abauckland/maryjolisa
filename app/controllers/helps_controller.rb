
  class HelpsController < ApplicationController
    before_action :set_help, only: [:show, :update]

    # GET /helps/1
    def show
      render :text=> @help.text 

    end

    # GET /helps/1/edit
    def edit
      authorize @help
      if current_user.company_id == 1
        @help = Help.find_by_item(params[:id]) || Help.create(:item => params[:id])
      end
    end

    # PATCH/PUT /helps/1
    def update
      authorize @help
      if @help.update(help_params)
#on create redirect back to dashbard
        redirect_to @help, notice: 'Help was successfully updated.'
      else
        render :edit
      end
    end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_help
        @help = Help.where(:item => params[:id]).first
      end

      # Only allow a trusted parameter "white list" through.
      def help_params
        params.require(:help).permit(:id, :item, :text)
      end
  end

