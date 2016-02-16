class AddFieldsToPerson < ActiveRecord::Migration
  def change
    add_column :people, :undergraduate_school, :string
    add_column :people, :graduate_school, :string
    add_column :people, :grade_year, :integer
  end
end
