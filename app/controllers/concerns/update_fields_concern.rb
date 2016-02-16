module Concerns::UpdateFieldsConcern
  extend ActiveSupport::Concern
  included do

    def get_field(field)
      DropdownField.find(field)
    end

    def get_options(field)
      get_field(field).options
    end

    before_action do
      @graduate_school = 4
      @graduate_year = 7
      @undergraduate_school = 5

      @subject = 1
      @subject_details = 10
      @subject_year = 8
      @subject_grade = 9

      @listing_shape = 2
      @category = 1
      @community = 1

      @graduate_year_options = get_options(@graduate_year)
      @subject_field = get_field(@subject)
      @subject_options = get_options(@subject)
      @subject_year_field = get_field(@subject_year)
      @subject_year_options = get_options(@subject_year)
    end

  end
end
