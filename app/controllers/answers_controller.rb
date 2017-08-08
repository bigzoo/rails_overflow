class AnswersController < ApplicationController
  before_action :authorize, only: [:new, :edit, :destroy, :upvote]
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end
  def create
    # @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params.merge(user_id:current_user.id).merge(question_id:params[:question_id]))
    if @answer.save
      flash[:notice]= "Answer Created Succesfully!"
      redirect_to question_path(@answer.question)
    else
      render :new
    end
  end
  def edit
    @answer = Answer.find(params[:id])
  end
  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice]= "Answer Updated Succesfully!"
      redirect_to question_path(@answer.question)
    else
      render :edit
    end
  end
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice]= "Answer Deleted Succesfully!"
    redirect_to question_path(@answer.question)
  end
  def upvote
    @answer = Answer.find(params[:answer])
    if @answer.increment! :votes
      flash[:notice]="Answer Upvoted!"
    end
    redirect_to question_path(@answer.question)
  end

  private
  def answer_params
    params.require(:answer).permit(:description)
  end
end
