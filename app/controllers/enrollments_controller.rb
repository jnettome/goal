class EnrollmentsController < ApplicationController
  skip_before_filter :require_login

  def index
  end

  def search
  end

  def users
    users_model = current_user.is_a? Teacher ? Student : Teacher

    if params[:term]
      like= "%".concat(params[:term].concat("%"))
      users = User.where("name like ?", like)
    else
      users = User.all
    end
    list = users.map {|u| Hash[ id: u.id, label: u.name, name: u.name]}
    render json: list
  end

  def enroll
    desired_user = User.find_by_name(params[:user_name])
    if current_user.is_a? Teacher
      current_user.students << desired_user unless current_user.students.include? desired_user
    elsif current_user.is_a? Student
      current_user.teachers << desired_user unless current_user.teachers.include? desired_user
    end
    return render json: true
  end
end
