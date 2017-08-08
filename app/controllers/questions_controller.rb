class QuestionsController < ApplicationController
  before_action :authorize, only: [:new, :edit, :destroy, :upvote]
  def new
    @question = Question.new
  end
  def create
    @question = Question.new(question_params.merge(user_id:current_user.id))
    if @question.save
      flash[:notice]= "Question Created Succesfully!"
      redirect_to questions_path
    else
      render :new
    end
  end
  def index
    @questions = Question.all
  end
  def show
    @question = Question.find(params[:id])
  end
  def edit
    @question = Question.find(params[:id])
  end
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice]= "Question Updated Succesfully!"
      redirect_to question_path(@question)
    else
      render :edit
    end
  end
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice]= "Question Deleted Succesfully!"
    redirect_to questions_path
  end
  def upvote
    @question = Question.find(params[:question])
    if @question.increment! :votes
      flash[:notice]="Question Upvoted!"
    end
    redirect_to question_path(@question)
  end

  private
  def question_params
    params.require(:question).permit(:user_id,:title,:description)
  end
end
