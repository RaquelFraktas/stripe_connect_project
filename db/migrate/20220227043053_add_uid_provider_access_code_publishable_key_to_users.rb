class AddUidProviderAccessCodePublishableKeyToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uid, :string
    add_column :users, :access_code, :string
    add_column :users, :provider, :string
    add_column :users, :publishable_keys, :string
  end
end
