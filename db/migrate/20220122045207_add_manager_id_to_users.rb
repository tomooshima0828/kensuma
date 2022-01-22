class AddManagerIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :manager
  end
end
