class ApplicationController < ActionController::Base
	before_action :quotation_adds

	def quotation_adds
		@add_spareparts = session['spareparts']
		@add_labours = session['labours']
		@add_discount = session['discount']
	end
end
