class AdminController < ApplicationController
  before_action :admin
  def index
    @users = User.all.where(admin:false)
    @admins = User.all.where(admin:true)
    all = User.all
    @others = all.select{|x| x != current_user}
  end
  def create
    @user = User.find(params[:user_id])
    if @user.update(admin:true)
      flash[:alert]="#{@user.username} is now an admin!"
      redirect_to admin_path
    else
      flash[:alert]='An error occurred, try again.'
      redirect_to admin_path
    end
  end
  def remove
    @user = User.find(params[:user_id])
    if @user.update(admin:false)
      flash[:alert]="#{@user.username} is nolonger an admin!"
      redirect_to admin_path
    else
      flash[:alert]='An error occurred, try again.'
      redirect_to admin_path
    end
  end
  def delete
    @user = User.find(params[:user_id])
    if @user.delete
      flash[:alert]="User Deleted"
      redirect_to admin_path
    else
      flash[:alert]='An error occurred, try again.'
      redirect_to admin_path
    end
  end
end
