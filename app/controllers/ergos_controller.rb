class ErgosController < ApplicationController
  before_action :set_ergo, only: [:show, :edit, :update, :destroy]

  def index
    @ergos = Ergo.all
  end

  def show
  end

  def new
    @ergo = Ergo.new
  end

  def edit
  end

  def create
    @ergo = Ergo.new(ergo_params)

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

    # Never trust parameters from the scary internet, only allow the white list through.
    def ergo_params
      params.require(:ergo).permit(:description, :score)
    end
end
