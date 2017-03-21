class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    enrollment = Enrollment.find_by(user: @user.id)
    courses_id_arr = enrollment.courses == nil ? nil : enrollment.courses.split(',')
    @courses = nil
    if (courses_id_arr)
      @courses = []
      courses_id_arr.each do |c|
        course = Course.find(c)
        @courses << course
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Succesful Signup!"
      Enrollment.create(user: @user.id)
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
