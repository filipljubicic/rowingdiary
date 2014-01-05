class MorningMonitoringsController < ApplicationController
  before_action :set_morning_monitoring, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :show, :edit, :destroy, :index]

  # GET /morning_monitorings
  # GET /morning_monitorings.json
  def index
    @morning_monitorings = MorningMonitoring.all.order(created_at: :desc)
  end

  # GET /morning_monitorings/1
  # GET /morning_monitorings/1.json
  def show
  end

  # GET /morning_monitorings/new
  def new
    @morning_monitoring = current_user.morning_monitorings.build
  end

  # GET /morning_monitorings/1/edit
  def edit
  end

  # POST /morning_monitorings
  # POST /morning_monitorings.json
  def create
    @morning_monitoring = current_user.morning_monitorings.build(morning_monitoring_params)

    respond_to do |format|
      if @morning_monitoring.save
        format.html { redirect_to @morning_monitoring, notice: 'Morning monitoring was successfully created.' }
        format.json { render action: 'show', status: :created, location: @morning_monitoring }
      else
        format.html { render action: 'new' }
        format.json { render json: @morning_monitoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /morning_monitorings/1
  # PATCH/PUT /morning_monitorings/1.json
  def update
    respond_to do |format|
      if @morning_monitoring.update(morning_monitoring_params)
        format.html { redirect_to @morning_monitoring, notice: 'Morning monitoring was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @morning_monitoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /morning_monitorings/1
  # DELETE /morning_monitorings/1.json
  def destroy
    @morning_monitoring.destroy
    respond_to do |format|
      format.html { redirect_to morning_monitorings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_morning_monitoring
      @morning_monitoring = MorningMonitoring.find(params[:id])
    end

    def correct_user
      @morning_monitoring = current_user.morning_monitorings.find_by(id: params[:id])
      redirect_to morning_monitoring_path, notice: "Not authorized to edit this" if @morning_monitoring.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def morning_monitoring_params
      params.require(:morning_monitoring).permit(:hr, :sleep, :notes)
    end
end
