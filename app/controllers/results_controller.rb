class ResultsController < ApplicationController
  def new
    @result = Result.new
    @lesson = Lesson.find params[:lesson_id]
    @word = Word.generate_random_word @lesson.category_id
    @options = @word.options
  end

  def create
  	results = Result.all
  	@lesson = Lesson.find params[:lesson_id]
    @result = Result.new result_params
    @result.option_id = params[:option_id]
    if @result.save
    	results = @lesson.results
    	if results.count < 5
      	redirect_to :back
      else
      	redirect_to lessons_path
      end
    else
      flash[:fail] = "fail"
      render "new"
    end
  end


	private

		def result_params
 			params.require(:result).permit(:lesson_id, :word_id, :option_id)
 		end
end
