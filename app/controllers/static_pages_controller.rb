class StaticPagesController < ApplicationController

  def subjects
    @subjects = Subject.all
  end

  def courses
    @courses = Course.all
  end

  def instructors
    @instructors = Instructor.all
  end

end
