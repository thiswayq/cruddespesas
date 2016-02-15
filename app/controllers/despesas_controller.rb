class DespesasController < ApplicationController
  before_action :set_despesa, only: [:show, :edit, :update, :destroy]
  before_action :all_despesas, only: [:index, :create, :update, :destroy]
  respond_to :html, :js
  # GET /despesas
  # GET /despesas.json
  def index2
  end
  # GET /despesas/1
  # GET /despesas/1.json
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /despesas/new
  def new
    @despesa = Despesa.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /despesas/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /despesas
  # POST /despesas.json
  def create
    @despesa = Despesa.new(despesa_params)

    respond_to do |format|
      if @despesa.save
        format.html { redirect_to @despesa, notice: 'Despesa was successfully created.' }
        format.json { render :show, status: :created, location: @despesa }
        format.js
      else
        format.html { render :new }
        format.json { render json: @despesa.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /despesas/1
  # PATCH/PUT /despesas/1.json
  def update
    respond_to do |format|
      if @despesa.update(despesa_params)
        format.html { redirect_to @despesa, notice: 'Despesa was successfully updated.' }
        format.json { render :show, status: :ok, location: @despesa }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @despesa.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /despesas/1
  # DELETE /despesas/1.json
  def destroy
    @despesa.destroy
    respond_to do |format|
      format.html { redirect_to despesas_url, notice: 'Despesa was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_despesa
      @despesa = Despesa.find(params[:id])
    end

    def all_despesas
      @despesas = Despesa.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def despesa_params
      params.require(:despesa).permit(:data, :time, :description, :amount, :comment)
    end
end
