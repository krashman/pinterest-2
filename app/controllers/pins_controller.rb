class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :update, :destroy]

	def index
		@pins = Pin.all
	end

	def new
		@pin = Pin.new
	end

	def create
		@pin = Pin.new(pin_params)
		current_user.pins << @pin

		if @pin.save
			redirect_to @pin, notice: 'Succesfully created this pin'
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @pin.update(pin_params)
			redirect_to @pin, notice: 'Pin was Succesfully updated'
		else
			render :edit
		end
	end

	def destroy
	end

	private
		def pin_params
			params.require(:pin).permit(:title, :description, :image)
		end

		def find_pin
			@pin = Pin.find(params[:id])
		end
end