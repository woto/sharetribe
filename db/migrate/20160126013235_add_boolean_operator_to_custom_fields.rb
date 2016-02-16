class AddBooleanOperatorToCustomFields < ActiveRecord::Migration
  def change
    add_column :custom_fields, :boolean_operator, :string
  end
end
