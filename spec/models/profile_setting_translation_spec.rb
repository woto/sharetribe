# == Schema Information
#
# Table name: profile_setting_translations
#
#  id                 :integer          not null, primary key
#  profile_setting_id :integer
#  locale             :string(255)
#  name               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#
# Indexes
#
#  index_profile_setting_translations_on_profile_setting_id  (profile_setting_id)
#

require 'spec_helper'

describe ProfileSettingTranslation do
  pending "add some examples to (or delete) #{__FILE__}"
end
