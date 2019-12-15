class LaboursController < ApplicationController
	def index
		if params[:find]
			@labours = Labour.where("name LIKE ?", "%#{params[:find]}%")
		else
			@labours = Labour.all
		end
	end

	def add
		return (flash[:error] = "cannot add labour to quotations" and redirect_to labours_path) unless params[:id]
		return (@add_labours.delete(params[:id].to_s) and flash[:notice] = "removed labour from quotations" and redirect_back(fallback_location: root_path)) if params[:remove]
		@add_labours << params[:id]
		flash[:notice] = "successfully add labour to quotations"
		redirect_to labours_path
	end
end
