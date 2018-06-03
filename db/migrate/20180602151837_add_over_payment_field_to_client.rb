class AddOverPaymentFieldToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :over_payment, :decimal, precision: 9, scale: 2
  end
end
