# == Schema Information
#
# Table name: custom_fields
#
#  id                :integer          not null, primary key
#  type              :string(255)
#  sort_priority     :integer
#  search_filter     :boolean          default(FALSE), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  community_id      :integer
#  required          :boolean          default(TRUE)
#  min               :float
#  max               :float
#  allow_decimals    :boolean          default(FALSE)
#  boolean_operation :string(255)
#  boolean_operator  :string(255)
#
# Indexes
#
#  index_custom_fields_on_community_id   (community_id)
#  index_custom_fields_on_search_filter  (search_filter)
#

class NumericField < CustomField
  validates_numericality_of :min
  validates_numericality_of :max, greater_than: :min

  def display_min
    allow_decimals ? min : min.to_i
  end

  def display_max
    allow_decimals ? max : max.to_i
  end

  def with_type(&block)
    block.call(:numeric)
  end
end
