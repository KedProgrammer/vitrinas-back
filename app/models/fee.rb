# == Schema Information
#
# Table name: fees
#
#  id              :bigint(8)        not null, primary key
#  value           :decimal(, )
#  capital_payment :string
#  decimal         :string
#  interes_rate    :decimal(, )
#  balance         :decimal(, )
#  fee_number      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  loan_id         :bigint(8)
#

class Fee < ApplicationRecord
  belongs_to :loan
  enum status: %i[not_payed payed]
end
