class StaticPagesController < ApplicationController

  def subjects
    @subjects = Subject.order(:name)
  end

  def courses
    @courses = Course.order(:name).paginate(page: params[:page])
  end

  def instructors
    @instructors = Instructor.order(:last)
  end

  def search_index
  end

  def search
    @query = params[:q]
    @subject = Subject.find(params[:subject]).name unless params[:subject] == ""
    if @subject == ""
      @courses = Course.where("name LIKE ?", "%#{@query}%").paginate(page: params[:page])
    elsif @query == ""
      @courses = Course.where("subjects LIKE ?", "%#{@subject}%").paginate(page: params[:page])
    else
      @courses = Course.where("name LIKE ? and subjects LIKE ?", "%#{@query}%", "%#{@subject}%").paginate(page: params[:page])
    end
  end

end
