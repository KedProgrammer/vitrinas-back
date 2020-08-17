class V1::Admin::LoansController < V1::Admin::OrdersController
  def create
    loan = Loan.create(loan_params)
    Loan::GenerateAmortization.call(loan)
    render json: loan
  end

  def index
    loans = Loan.includes(:employee)
    render json: loans
  end

  private
  def loan_params
    params.require(:loan).permit(:amount, :interes_rate, :period_type, :period_number)
  end
end