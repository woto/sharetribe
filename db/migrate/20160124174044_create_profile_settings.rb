class CreateProfileSettings < ActiveRecord::Migration
  def change
    create_table :profile_settings do |t|
      t.references :community, index: true

      t.timestamps
    end
  end
end
