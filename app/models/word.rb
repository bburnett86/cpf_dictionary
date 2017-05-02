require 'csv'
class Word < ApplicationRecord
	include ApplicationHelper

	validates :abbreviation, presence: true, uniqueness: true, length: {maximum: 5}
	validates :full_word, presence: true, uniqueness: true
	validates :definition, presence: true

	def self.search(term)
		if term
			where('abbreviation iLIKE ?', "%#{term}%").order('full_word DESC')
		else
			all	
		end
	end

	def self.to_csv(options = {})
	  desired_columns = ["abbreviation", "full_word", "definition"]
	  CSV.generate(options) do |csv|
	    csv << desired_columns
	    all.each do |word|
	      csv << word.attributes.values_at(*desired_columns)
	    end
	  end
	end

	def self.import(file)
  spreadsheet = Roo::Spreadsheet.open(file.path)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    word = find_by(id: row["id"]) || new
    word.attributes = row.to_hash
    word.save!
  end
end

end