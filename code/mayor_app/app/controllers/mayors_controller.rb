class MayorsController < ApplicationController
  before_action :set_mayor, only: [:show, :edit, :update, :destroy]

  # GET /mayors
  # GET /mayors.json
  def index
    @mayors = Mayor.all
  end

  # GET /mayors/1
  # GET /mayors/1.json
  def show
  end

  # GET /mayors/new
  def new
    @mayor = Mayor.new
  end

  # GET /mayors/1/edit
  def edit
  end

  # POST /mayors
  # POST /mayors.json
  def create
    @mayor = Mayor.new(mayor_params)

    respond_to do |format|
      if @mayor.save
        format.html { redirect_to @mayor, notice: 'Mayor was successfully created.' }
        format.json { render :show, status: :created, location: @mayor }
      else
        format.html { render :new }
        format.json { render json: @mayor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mayors/1
  # PATCH/PUT /mayors/1.json
  def update
    respond_to do |format|
      if @mayor.update(mayor_params)
        format.html { redirect_to @mayor, notice: 'Mayor was successfully updated.' }
        format.json { render :show, status: :ok, location: @mayor }
      else
        format.html { render :edit }
        format.json { render json: @mayor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mayors/1
  # DELETE /mayors/1.json
  def destroy
    @mayor.destroy
    respond_to do |format|
      format.html { redirect_to mayors_url, notice: 'Mayor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mayor
      @mayor = Mayor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mayor_params
      params.require(:mayor).permit(:name, :age)
    end
end
