module Concerns::UpdateFieldsConcern
  extend ActiveSupport::Concern
  included do

    def get_field(field)
      CustomField.find(field)
    end

    def get_options(field)
      get_field(field).options
    end

    before_action do
      @graduate_school = 4
      @graduate_year = 7
      @undergraduate_school = 5

      @subject = 1
      @subject_year = 8
      @subject_grade = 9
      @subject_details_field_id = 10

      @i_am_a_teacher = 7
      @i_am_a_student = 6

      @i_am_a_teacher_category = 2
      @i_am_a_student_category = 3

      @community = 1

      @graduate_year_options = get_options(@graduate_year)

      @subject_field = get_field(@subject)
      @subject_options = get_options(@subject).to_a
      @subject_year_field = get_field(@subject_year)
      @subject_year_options = get_options(@subject_year)
      @subject_grade_field = get_field(@subject_grade)
      @subject_details_field = get_field(@subject_details_field_id)
    end

  end
end
