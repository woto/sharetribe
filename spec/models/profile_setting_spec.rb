# == Schema Information
#
# Table name: profile_settings
#
#  id           :integer          not null, primary key
#  community_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_profile_settings_on_community_id  (community_id)
#

require 'spec_helper'

describe ProfileSetting do
  pending "add some examples to (or delete) #{__FILE__}"
end
