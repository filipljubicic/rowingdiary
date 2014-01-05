class PbsController < ApplicationController
  before_action :set_pb, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :show, :edit, :destroy, :index]

  # GET /pbs
  # GET /pbs.json
  def index
    @pbs = Pb.all.order(created_at: :desc)
  end

  # GET /pbs/1
  # GET /pbs/1.json
  def show
  end

  # GET /pbs/new
  def new
    @pb = current_user.pbs.build
  end

  # GET /pbs/1/edit
  def edit
  end

  # POST /pbs
  # POST /pbs.json
  def create
    @pb = current_user.pbs.build(pb_params)

    respond_to do |format|
      if @pb.save
        format.html { redirect_to @pb, notice: 'PB was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pb }
      else
        format.html { render action: 'new' }
        format.json { render json: @pb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pbs/1
  # PATCH/PUT /pbs/1.json
  def update
    respond_to do |format|
      if @pb.update(pb_params)
        format.html { redirect_to @pb, notice: 'PB was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pbs/1
  # DELETE /pbs/1.json
  def destroy
    @pb.destroy
    respond_to do |format|
      format.html { redirect_to pbs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pb
      @pb = Pb.find(params[:id])
    end

    def correct_user
      @pb = current_user.pbs.find_by(id: params[:id])
      redirect_to pbs_path, notice: "Not authorized to edit this" if @pb.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pb_params
      params.require(:pb).permit(:distance, :split, :time, :date, :rate, :watt)
    end
end
