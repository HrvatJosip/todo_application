class ItemsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_item, only: [:edit, :update, :destroy]
	before_action :find_list, only: [:edit, :update, :destroy]
	before_filter :require_permission, only: [:new, :edit]

	def new
		@list = List.find(params[:list_id])
		@item = Item.new
	end

	def create
		@list = List.find(params[:list_id])
		@item = @list.items.build(item_params)
		if @item.save
			redirect_to @list
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @item.update(item_params)
			redirect_to @list
		else
			render :edit
		end
	end

	def destroy
		@item.destroy
		redirect_to @list
	end

	def toggle
		@item = Item.find(params[:id])
		@item.update_attributes(:is_complete => params[:is_complete])
		redirect_to root_path
	end

	private

		def item_params
			params.require(:item).permit(:task)
		end

		def find_item
			@item = Item.find(params[:id])
		end

		def find_list
			@list = List.find(params[:list_id])
		end

		def require_permission
			if current_user != find_list.user
				flash[:error] = "Error"
				redirect_to error_path
			end
		end
end
