class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column(:users, :admin, :boolean)
    add_column(:users, :first_name, :text)
    add_column(:users, :last_name, :text)
    add_column(:users, :username, :text)
  end
end
