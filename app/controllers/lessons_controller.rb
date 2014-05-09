class LessonsController < ApplicationController
  before_action :signed_in_user

  def new
    if params[:lesson_id]
      current_lesson = Lesson.find params[:lesson_id]
      @lesson = Lesson.create(user_id: current_user.id, category_id: current_lesson.category_id)
      current_lesson.results.each do |result|
        Result.create lesson_id: @lesson.id, word_id:result.word_id
      end
    else
  	  @lesson = Lesson.new(category_id: params[:category_id], count_correct: nil, user_id: current_user.id)
      if @lesson.save
        redirect_to new_lesson_result_path(lesson_id: @lesson.id)
      end
    end
  end

  

  def show
  	@lesson = Lesson.find params[:id]
  	@results = @lesson.results
  end

  def create

  	if lesson.save
      words = Word.all
      a = Array.new
      words.each do |word|
        a.push(word.id)
      end
      (1..5).each do |i|
        t = a[Random.rand(a.count)]
        a.delete(t)
        word = words[t]
        result = Result.new
        result.lesson_id = lesson.id
        result.word_id = word.id
        result.option_id = 0
        result.save!
      end
      flash[:success] = "Create Lesson Successfull!"
      redirect_to lesson_path(lesson.id)
    else
      flash[:error] = "Error"
      render 'new'
    end
  end

  def lesson_params
      params.require(:lesson).permit(:user_id,:category_id,:count_correct,lesson_results_attributes: [:result_id, :word_id, :choosen])
    end
end
