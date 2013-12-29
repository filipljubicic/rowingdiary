class WeightsController < ApplicationController
  before_action :set_weight, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :show, :edit, :destroy, :index]

  # GET /weights
  # GET /weights.json
  def index
    @weights = Weight.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @weight = current_user.weights.build
  end

  def edit
  end

  def create
    @weight = current_user.weights.build(weight_params)

    respond_to do |format|
      if @weight.save
        format.html { redirect_to @weight, notice: 'Weight was successfully created.' }
        format.json { render action: 'show', status: :created, location: @weight }
      else
        format.html { render action: 'new' }
        format.json { render json: @weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weights/1
  # PATCH/PUT /weights/1.json
  def update
    respond_to do |format|
      if @weight.update(weight_params)
        format.html { redirect_to @weight, notice: 'Weight was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weights/1
  # DELETE /weights/1.json
  def destroy
    @weight.destroy
    respond_to do |format|
      format.html { redirect_to weights_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weight
      @weight = Weight.find(params[:id])
    end

    def correct_user
      @weight = current_user.weights.find_by(id: params[:id])
      redirect_to weights_path, notice: "Not authorized to edit this" if @weight.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weight_params
      params.require(:weight).permit(:exercise, :reps, :weight, :sets, :notes)
    end
end
