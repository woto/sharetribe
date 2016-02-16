class CreateProfileSettingTranslations < ActiveRecord::Migration
  def change
    create_table :profile_setting_translations do |t|
      t.references :profile_setting, index: true
      t.string :locale
      t.string :name

      t.timestamps
    end
  end
end
