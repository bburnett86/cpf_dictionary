class WordsController < ApplicationController
	include ApplicationHelper

	before_action :authorize, except: [:index, :home, :results]

	def index
		@words = Word.all
		render :index
	end

	def create
		@word = Word.new(abbreviation: params[:word][:abbreviation], full_word: params[:word][:full_word], definition: params[:word][:definition], user_id: params[:word][:user_id])

		if @word.save
			redirect_to results_path
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

	def update
		@word = Word.find(params[:id])
		@word.update(abbreviation: params[:word][:abbreviation], full_word: params[:word][:full_word], definition: params[:word][:definition])

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

	def home
		render :home
	end

	def results
		@words = Word.search(params[:term])
		render :results
	end

	private

	def word_params
		params.require(:word).permit(:abbreviation, :full_word, :definition, :term)
	end
	
end
