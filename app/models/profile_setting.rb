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

class ProfileSetting < ActiveRecord::Base
  attr_accessible(
    #:community_id,
    #:parent_id,
    #:translations,
    :translation_attributes,
    #:sort_priority,
    #:url,
    #:basename
  )
  belongs_to :community
  has_many :translations, :class_name => "ProfileSettingTranslation", :dependent => :destroy

  def display_name(locale)
    TranslationCache.new(self, :translations).translate(locale, :name)
  end

  def translation_attributes=(attributes)
    build_attrs = attributes.map { |locale, values| { locale: locale, values: values } }
    build_attrs.each do |translation|
      if existing_translation = translations.find_by_locale(translation[:locale])
        existing_translation.update_attributes(translation[:values])
      else
        translations.build(translation[:values].merge({:locale => translation[:locale]}))
      end
    end
  end

  def remove_needs_caution?
    false
    # TODO
    #has_own_or_subcategory_listings? or has_subcategories?
  end

end
