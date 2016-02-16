class AddAdditionalToPeople < ActiveRecord::Migration
  def change
    add_column :people, :additional, :text
  end
end
