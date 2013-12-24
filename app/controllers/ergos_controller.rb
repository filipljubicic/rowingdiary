class ErgosController < ApplicationController
  before_action :set_ergo, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :show, :edit, :destroy, :index]

  def index
    @ergos = Ergo.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @ergo = current_user.ergos.build
  end

  def edit
  end

  def create
    @ergo = current_user.ergos.build(ergo_params)

    respond_to do |format|
      if @ergo.save
        format.html { redirect_to @ergo, notice: 'Ergo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ergo }
      else
        format.html { render action: 'new' }
        format.json { render json: @ergo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ergo.update(ergo_params)
        format.html { redirect_to @ergo, notice: 'Ergo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ergo.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @ergo.destroy
    respond_to do |format|
      format.html { redirect_to ergos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ergo
      @ergo = Ergo.find(params[:id])
    end

    def correct_user
      @ergo = current_user.ergos.find_by(id: params[:id])
      redirect_to ergos_path, notice: "Not authorized to edit this pin" if @ergo.nil?
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def ergo_params
      params.require(:ergo).permit(:description, :score, :split, :rate, :watts, :distance, :time, :notes)
    end
end
