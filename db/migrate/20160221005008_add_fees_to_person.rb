class AddFeesToPerson < ActiveRecord::Migration
  def change
    add_column :people, :offer_fee, :float
    add_column :people, :request_fee, :float
  end
end
