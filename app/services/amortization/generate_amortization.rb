module Amortization
  class GenerateAmortization < ApplicationService
    attr_accessor :loan, :interest_rate, :period, :amount, :remaining_payment,
      :fees

    def initialize(loan)
      @loan = loan
      @interest_rate = loan.interest_rate
      @period = loan.period_number
      @amount = loan.amount
      @remaining_payment = loan.remaining_payment
      @fees = []
    end

    def call
      virtual_remaining_payment = remaining_payment

      period.times.each do |number|
        interest_amount = interest_rate * virtual_remaining_payment
        capital_payment = fee_value - interest_amount
        virtual_remaining_payment -= capital_payment
        fees << { value: fee_value, fee_number: number + 1,
          interest_amount: interest_amount, capital_payment: capital_payment,
          balance: virtual_remaining_payment }
      end

      loan.fees.create(fees)
    end

    private

    def fee_value
      @value ||= -> {
        ((amount * (1 + interest_rate) ** period * interest_rate) / ((1 + interest_rate) ** period - 1))
      }.call
    end
  end
end
