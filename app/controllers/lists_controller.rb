class ListsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_list, only: [:show, :edit, :update, :destroy]
	before_filter :require_permission, only: :edit

	def index
		@lists = current_user.lists
	end

	def new
		@list = current_user.lists.build
	end

	def create
		@list = current_user.lists.build(list_params)
		if @list.save
			redirect_to @list
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @list.update(list_params)
			redirect_to @list
		else
			render 'edit'
		end
	end

	def destroy
		@list.destroy
		redirect_to lists_path
	end

	private

		def list_params
			params.require(:list).permit(:title, :description)
		end

		def find_list
			@list = List.find(params[:id])
		end

		def require_permission
			if current_user != List.find(params[:id]).user
				flash[:success] = "Here"
				redirect_to root_path
			end
		end
end
