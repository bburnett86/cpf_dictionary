class WordImportsController < ApplicationController
	def new
    @word_import = WordImport.new
  end

  def create
    @word_import = WordImport.new(params[:word_import])
    if @word_import.save
      redirect_to root_url, notice: "Imported words successfully."
    else
      render :new
    end
  end
  
end
