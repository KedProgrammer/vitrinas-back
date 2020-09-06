class V1::Admin::LoansController < V1::Admin::OrdersController
  def create
    employee = Employee.find(params[:employer_id])
    loan = employee.loans.create(loan_params)
    render json: loan
  end

  def index
    loans = Loan.includes(:employee)
    render json: loans
  end

  def destroy
    loan = Loan.find(params[:id])
    loan.destroy
    render json: 'Eliminated', status: :ok
  end

  private
  def loan_params
    params.require(:loan).permit(:amount, :interest_rate, :period_type, :period_number)
  end
end