class AddTimeStampsToTransactions < ActiveRecord::Migration
  def change
    add_timestamps(:transactions)
  end
end
