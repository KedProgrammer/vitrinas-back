# == Schema Information
#
# Table name: orders
#
#  id            :bigint(8)        not null, primary key
#  initial_date  :datetime
#  bill_number   :bigint(8)
#  comments      :text
#  aasm_state    :string
#  client_name   :string
#  client_number :bigint(8)
#  total         :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Order < ApplicationRecord
  validates :bill_number, uniqueness: { message: 'Numero de factura debe ser unico'}, on: :create
  validate :validate_initial_date, on: :create
  include AASM
  aasm do
    state :en_proceso, initial: true
    state :orden_terminada, :orden_entregada
    event :terminar_orden do
      transitions :from => :en_proceso, :to => :orden_terminada
    end
    event :entregar_orden do
      transitions :from => :orden_terminada, :to => :orden_entregada
    end
  end

  def change_state(state)
    case state
    when 'orden_terminada'
      entregar_orden!
    when 'en_proceso'
      terminar_orden!
    end
  end

  def self.searh_orders_by_range(start_date,end_date)
    where(initial_date: Date.parse(start_date).beginning_of_day..Date.parse(end_date).end_of_day)
  end
  def self.search_orders(date)
    where(initial_date: Date.parse(date).beginning_of_day..Date.parse(date).end_of_day)
  end

  private
  def validate_initial_date
    errors.add(:initial_date, message: "La fecha de factura no puede estar en el pasado") if initial_date < Date.today
  end
end
