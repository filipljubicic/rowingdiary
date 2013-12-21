class ErgosController < ApplicationController
  before_action :set_ergo, only: [:show, :edit, :update, :destroy]

  # GET /ergos
  # GET /ergos.json
  def index
    @ergos = Ergo.all
  end

  # GET /ergos/1
  # GET /ergos/1.json
  def show
  end

  # GET /ergos/new
  def new
    @ergo = Ergo.new
  end

  # GET /ergos/1/edit
  def edit
  end

  # POST /ergos
  # POST /ergos.json
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

  # PATCH/PUT /ergos/1
  # PATCH/PUT /ergos/1.json
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

  # DELETE /ergos/1
  # DELETE /ergos/1.json
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
