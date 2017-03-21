class EnrollmentsController < ApplicationController

  def enroll
    @user = current_user
    @enrollment = Enrollment.find_by(user: @user.id)
    @course_id = params[:course_id]

    # check if user is already enrolled in this course
    enrolled_courses = @enrollment.courses.split(',') unless @enrollment.courses == nil
    if (enrolled_courses != nil)
      enrolled_courses.each do |enrolled_course|
        if enrolled_course == @course_id
            flash[:danger] = "Already enrolled in #{Course.find(@course_id).code}!"
            redirect_to(:back)
            return
        end
      end
    end

    # if not, enroll in this course
    @enrollment.courses == nil ? @enrollment.courses = @course_id :
                                 @enrollment.courses = @enrollment.courses + "," + @course_id
    @enrollment.save
    flash[:success] = "Succesful enrollment in #{Course.find(@course_id).code}!"
    #byebug
    redirect_to(:back)
  end

end
