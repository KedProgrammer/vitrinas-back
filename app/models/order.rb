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
#  place         :integer
#  delivery_date :date
#  seller_name   :string
#  description   :text
#

class Order < ApplicationRecord
  enum place: %i[almacen produccion]
  validates :bill_number, :order_number,
            uniqueness: { message: 'Numero de factura y/o numero de pedido debe ser unico' },
            on: :create
  validates :description, :seller_name, :delivery_date, :place,
            :client_number,
            :client_name, :comments, :order_number, :initial_date, presence: true
  validate :validate_initial_date
  include AASM
  aasm do
    state :en_proceso, initial: true
    state :orden_terminada, :orden_entregada
    event :terminar_orden do
      transitions from: :en_proceso, to: :orden_terminada
    end
    event :entregar_orden do
      transitions from: :orden_terminada, to: :orden_entregada
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

  def self.searh_orders_by_range(start_date, end_date, place)
    where(initial_date: Date.parse(start_date).beginning_of_day..Date.parse(end_date).end_of_day, place: place)
  end

  def self.search_orders(date, place)
    where(initial_date: Date.parse(date).beginning_of_day..Date.parse(date).end_of_day, place: place)
  end

  private

  def validate_initial_date
    errors.add(:initial_date, message: 'La fecha de factura no puede estar en el futuro') if initial_date.to_date > Date.current
  end
end
