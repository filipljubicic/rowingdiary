class WatersController < ApplicationController
  before_action :set_water, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :show, :edit, :destroy, :index]

  # GET /waters
  # GET /waters.json
  def index
    @waters = Water.all.order(created_at: :desc)
  end

  # GET /waters/1
  # GET /waters/1.json
  def show
  end

  # GET /waters/new
  def new
    @water = current_user.waters.build
  end

  # GET /waters/1/edit
  def edit
  end

  # POST /waters
  # POST /waters.json
  def create
    @water = current_user.waters.build(water_params)

    respond_to do |format|
      if @water.save
        format.html { redirect_to @water, notice: 'Water was successfully created.' }
        format.json { render action: 'show', status: :created, location: @water }
      else
        format.html { render action: 'new' }
        format.json { render json: @water.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waters/1
  # PATCH/PUT /waters/1.json
  def update
    respond_to do |format|
      if @water.update(water_params)
        format.html { redirect_to @water, notice: 'Water was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @water.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waters/1
  # DELETE /waters/1.json
  def destroy
    @water.destroy
    respond_to do |format|
      format.html { redirect_to waters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_water
      @water = Water.find(params[:id])
    end

    def correct_user
      @water = current_user.waters.find_by(id: params[:id])
      redirect_to waters_path, notice: "Not authorized to edit this" if @water.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def water_params
      params.require(:water).permit(:distance, :BoatType, :SessionDescription, :crew, :notes)
    end
end
