class StaticPagesController < ApplicationController

  def subjects
    @subjects = Subject.all.sort_by &:name
  end

  def courses
    @courses = Course.all.sort_by &:name
  end

  def instructors
    @instructors = Instructor.all.sort_by &:last
  end

  def search_index
  end

  def search
    @query = params[:q]
    @courses = Course.where("subjects LIKE ? or name LIKE ?", "%#{@query}%", "%#{@query}%")
  end

end
