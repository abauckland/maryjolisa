
  class HelpsController < ApplicationController
    before_action :set_help, only: [:show, :edit, :update, :create, :destroy]


    def index
      @helps = Help.all
      authorize @helps
    end

    # GET /helps/1
    def show
      render :text=> @help.text 
    end

    def new
      @help = Help.new      
    end

    # GET /helps/1/edit
    def edit
      authorize @help
    end

    # POST /pages
    def create
      @help = Help.new(page_params)
      authorize @help
      if @page.save
        redirect_to @help, notice: 'Help item was successfully created.'
      else
        render :new
      end
    end


    # PATCH/PUT /helps/1
    def update
      authorize @help
      if @help.update(help_params)
#on create redirect back to dashbard
        redirect_to @help, notice: 'Help item was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /pages/1
    def destroy
      @help.destroy
      redirect_to helps_url, notice: 'help item was successfully destroyed.'
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

