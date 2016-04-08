class ItemsController < ApplicationController

	def new
		@list = List.find(params[:list_id])
		@item = Item.new
	end

	def create
		@list = List.find(params[:list_id])
		@item = @list.items.build(item_params)
		if @item.save
			redirect_to lists_path
		else
			render :new
		end
	end

	def edit
		@item = Item.find(params[:id])
		@list = @item.list
	end

	def update
		@item = Item.find(params[:id])
		@list = @item.list
		if @item.update(item_params)
			redirect_to @list
		else
			render :edit
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@list = @item.list
		@item.destroy
		redirect_to @list
	end

	private

		def item_params
			params.require(:item).permit(:task)
		end
end
