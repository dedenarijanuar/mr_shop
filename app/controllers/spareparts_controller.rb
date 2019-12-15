class SparepartsController < ApplicationController
	def index
		if params[:find]
			@spareparts = Sparepart.where("name LIKE ?", "%#{params[:find]}%")
		else
			@spareparts = Sparepart.all
		end
	end

	def add
		return (flash[:error] = "cannot add sparepart to quotations" and redirect_to spareparts_path) unless params[:id]
		return (@add_spareparts.delete(params[:id].to_s) and flash[:notice] = "removed sparepart from quotations" and redirect_back(fallback_location: root_path)) if params[:remove]
		@add_spareparts << params[:id]
		flash[:notice] = "successfully add sparepart to quotations"
		redirect_to spareparts_path
	end
end
