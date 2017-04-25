class Word < ApplicationRecord

	belongs_to :user

	def self.search(term)
		if term
			where('abbreviation iLIKE ?', "%#{term}%").order('full_word DESC')
		else
			all	
		end
	end

end
