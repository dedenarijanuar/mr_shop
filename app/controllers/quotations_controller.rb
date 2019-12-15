class QuotationsController < ApplicationController
	def index
		@quotations = Quotation.all
	end

	def order_details
		return (flash[:error] = "please add spareparts and labours first" and redirect_to spareparts_path) if @add_spareparts.blank? || @add_labours.blank?
		@spareparts = Sparepart.where(id: @add_spareparts) rescue []
		@labours = Labour.where(id: @add_labours) rescue []

		@total_order = (@spareparts.pluck(:price).sum + @labours.pluck(:price).sum ) rescue 0
		@total_order = (@total_order - (@total_order * @add_discount / 100)) rescue 0
	end

	def add_discount
		return (flash[:error] = "please input discount.." and redirect_back(fallback_location: root_path)) if params[:discount].blank?

		return (flash[:error] = "discount not found" and redirect_back(fallback_location: root_path)) if params[:discount].present? && params[:discount] != 'MRDISCOUNT'
		session['discount'] = 10
		flash[:notice] = "successfully add discount"
		redirect_back(fallback_location: root_path)
	end

	def order_saved
		@spareparts = Sparepart.where(id: @add_spareparts) rescue []
		@labours = Labour.where(id: @add_labours) rescue []

		total_order = (@spareparts.pluck(:price).sum + @labours.pluck(:price).sum ) rescue 0
		total_order = total_order - ((total_order * @add_discount / 100) rescue 0)

		quotation = Quotation.new
		quotation.total_price = total_order
		quotation.discount = @add_discount
		quotation.save
		@add_spareparts.each do |qs|
			QuotationSparepart.create(quotation_id: quotation.id, sparepart_id: qs)
			puts qs
		end

		@add_labours.each do |qs|
			QuotationLabour.create(quotation_id: quotation.id, labour_id: qs)
			puts qs
		end

		flash[:notice] = "successfully Saved Quotation"
		session['spareparts'] = []
		session['labours'] = []
		session['discount'] = nil
		redirect_to root_path
	end

	def order_reset
		session['spareparts'] = []
		session['labours'] = []
		session['discount'] = nil

		flash[:notice] = "successfully Reset Quotations"
		redirect_to root_path

	end

	def views
		@quotation = Quotation.find_by_id(params[:id])
		return (flash[:error] = "quotation not found" and redirect_back(fallback_location: root_path)) if params[:id].blank?
		qs = @quotation.quotation_spareparts.pluck(:id) rescue []
		ql = @quotation.quotation_labours.pluck(:id) rescue []
		@spareparts = Sparepart.where(id: qs) rescue []
		@labours = Labour.where(id: ql) rescue []
		respond_to do |format|
	      format.html
	      format.pdf do |pdf|
			@pdf = WickedPdf.new.pdf_from_url("#{root_url}/quotations/#{@quotation.id}/get_html")
			send_data(@pdf, filename: "#{@quotation.id}_quotaion_reviewed.pdf", type: "application/pdf")
		  end
	    end
	end

	def get_html
		@quotation = Quotation.find_by_id(params[:id])
		return (flash[:error] = "quotation not found" and redirect_back(fallback_location: root_path)) if params[:id].blank?
		qs = @quotation.quotation_spareparts.pluck(:id) rescue []
		ql = @quotation.quotation_labours.pluck(:id) rescue []
		@spareparts = Sparepart.where(id: qs) rescue []
		@labours = Labour.where(id: ql) rescue []
		render layout: 'get_html'
	end
end
