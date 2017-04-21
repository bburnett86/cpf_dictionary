class WordsController < ApplicationController

	before_action :authorize, except: [:index, :show]

	def index
		@words = Word.search(params[:term])
		render :index
	end

	def create
		@word = Word.new(params[:word])

		if @word.save
			redirect_to new_word_path
		else
			@errors = @word.errors.full_messages
			render :new
		end
	end

	def new
		@word = Word.new(params[:word])

		render :new
	end

	def edit
		@word = Word.find(params[:id])

		render :edit
	end

	def show
		@word = Word.find(params[:id])

		render :show
	end

	def update
		@word = Word.find(params[:id])
		@word.assign_attributes!(params[:word])

		if @word.save
			redirect_to root_path
		else
			@errors = @word.errors.full_messages
			render :edit
		end
	end

	def destroy
		@word = Word.find(params[:id])

		@word.destroy

		redirect_to root_path
	end

	private

	def word_params
		params.require(:word).permit(:abbreviation, :full_word, :definition, :term)
	end
	
end
