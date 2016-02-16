class AddBooleanOperationToCustomFields < ActiveRecord::Migration
  def change
    add_column :custom_fields, :boolean_operation, :string
  end
end
