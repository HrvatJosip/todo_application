class PagesController < ApplicationController
	def index
		if user_signed_in?
			redirect_to lists_path
		end
	end

	def error
	end
end
