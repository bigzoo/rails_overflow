class MainController < ApplicationController
  def index
    @questions = Question.all.order('id ASC').reorder('votes DESC')
  end
end
