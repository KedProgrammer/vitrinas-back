class V1::Admin::EmployersController < ApplicationController
  def create
    employee = Employee.create(employees_params)
    render json: employee
  end

  def index
    employers = Employee.all
    render json: employers
  end

  def update
    employer = Employee.find(params[:id])
    employer.update!(employees_params)
    render json: employer
  end

  private

  def employees_params
    params.require(:employer).permit(:name, :last_name, :age, :identification, :job_position, :cellphone, :initial_date, :email)
  end
end