class Quotation < ApplicationRecord
	has_many :quotation_labours
	has_many :quotation_spareparts

	def list_spareparts
		spareparts = ""
		s = Sparepart.where(id: self.quotation_spareparts.pluck(:sparepart_id))
		s.each do |x|
			spareparts << "- #{x.name} <br/>"
		end
		return spareparts.html_safe
	end

	def list_labours
		labours = ""
		s = Labour.where(id: self.quotation_labours.pluck(:labour_id))
		s.each do |x|
			labours << "- #{x.name} <br/>"
		end
		return labours.html_safe
	end
end
