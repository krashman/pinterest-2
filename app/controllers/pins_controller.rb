class PinsController < ApplicationController
	def index
	end

	def new
		@pin = Pin.new
	end

	def create
		@pin = Pin.new(pin_params)

		if @pin.save
			redirect_to @pin, notice: 'Succesfully created this pin'
		else
			render :new
		end
	end

	def show
		find_pin
	end

	private
		def pin_params
			params.require(:pin).permit(:title, :description)
		end

		def find_pin
			@pin = Pin.find(params[:id])
		end
end