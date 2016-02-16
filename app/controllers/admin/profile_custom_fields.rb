class Admin::ProfileCustomFieldsController < ApplicationController
  before_filter :ensure_is_admin
end
