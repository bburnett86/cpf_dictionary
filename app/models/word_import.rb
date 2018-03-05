class WordImport
  include ActiveModel::Model
  attr_accessor :file

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_words.map(&:valid?).all?
      imported_words.each(&:save!)
      true
    else
      imported_words.each_with_index do |word, index|
        word.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_words
    @imported_words ||= load_imported_words
  end

  def load_imported_words
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      word = Word.find_by(abbreviation: row["abbreviation"])
      if !word
        word = Word.new
        word.attributes = row.to_hash
        return word
      end
      return word
    end    
  end

end