class Api::V1::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_auth_token
 
	def create
  	@item = Item.new(items_params)
  	
  	if @item.save
		 	render json: {message:"Item created successfully!",status: 200}
		 else
		 	render :json => {status:422}		 
		 end	
  end

	private
	def items_params
  	params.require(:item).permit(:title,:detailed_review)
  end
end
