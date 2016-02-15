class Api::DespesasController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def index
		@despesas = Despesa.all
	end

	def show
		@despesa = Despesa.find(params[:id])
	end

	def destroy
		id = params[:id]
		Despesa.destroy id
		render json: {success: true, msg: "Deletado!"}
	end

	def edit
	end

	def update
		@despesa = Despesa.find params[:id]
		@despesa.update(despesa_params)
		render json: {sucess: true, msg: "Atualizado"}
	end

	def create
		Despesa.create(despesa_params)
		render json: {succes: true, msg: "Criado com sucesso"}
	end

	private

	def despesa_params
		params.permit(:data, :time, :description, :amount, :comment)
	end
end