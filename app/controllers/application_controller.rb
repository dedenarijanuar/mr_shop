class ApplicationController < ActionController::Base
	before_action :quotation_adds

	def quotation_adds
session['spareparts'] = [] unless session['spareparts']
session['labours'] = [] unless session['labours']
session['discount'] = [] unless session['discount']

#session['spareparts'] = []
#session['labours'] = []
#session['discount'] = nil

		@add_spareparts = session['spareparts']
		@add_labours = session['labours']
		@add_discount = session['discount']
	end
end
