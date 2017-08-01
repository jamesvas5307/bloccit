class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def edit
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params[:question][:resolved]

    if @question.save
      flash[:notice] = "Question was saved."
      redirect_to @question
    else
      # if no successful alert the user and render the new view again.
      flash.now[:alert] = "There was an error saving the question. Please try again"
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
  end

  def question_params
    params.require(:question).permit(:title, :body, :resolved)
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:notice] = "Question was updated."
      redirect_to @question
    else
      flash.now[:alert] = "There was an error saving the quesiton. Please try again"
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:notice] = "\"#{@question.title}\" was deleted successfully."
      redirect_to questions_path
    else
      flash.now[:alert] = "There was an error deleting the question"
      render :show
    end
  end
end
