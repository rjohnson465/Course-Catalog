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

  def unenroll
    @enrollment = Enrollment.find_by(user: current_user.id)
    enrolled_courses = @enrollment.courses.split(',')
    new_enrolled_courses = nil
    enrolled_courses.each do |course|
      if course != params[:course_id]
        if new_enrolled_courses == nil
          new_enrolled_courses = course.id
        else
          new_enrolled_courses = new_enrolled_courses + "," + course.id.to_s
        end
      end
    end
    @enrollment.courses = new_enrolled_courses
    @enrollment.save
    flash[:success] = "Unenrolled from #{Course.find(params[:course_id]).code}!"
    redirect_to(:back)
  end

end
