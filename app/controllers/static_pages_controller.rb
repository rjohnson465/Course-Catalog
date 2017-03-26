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
    @subject = Subject.find(params[:subject]).name
    if @subject == ""
      @courses = Course.where("name LIKE ?", "%#{@query}%")
    elsif @query == nil || @query == ""
      @courses = Course.where("subjects LIKE ?", "%#{@subject}%")
    else
      @courses = Course.where("name LIKE ? and subjects LIKE ?", "%#{@query}%", "%#{@subject}%")
    end
  end

end
