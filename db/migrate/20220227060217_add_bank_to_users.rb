class AddBankToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :bank, :string
  end
end
