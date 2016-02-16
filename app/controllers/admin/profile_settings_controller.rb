class Admin::ProfileSettingsController < ApplicationController

  before_filter :ensure_is_admin

  def index
    @selected_left_navi_link = "listing_profile_settings"
    @profile_settings = @current_community.profile_settings(:translations)
  end

  def new
    @selected_left_navi_link = "listing_profile_settings"
    @profile_setting = ProfileSetting.new
  end

  def create
    @selected_left_navi_link = "listing_profile_settings"
    @profile_setting = ProfileSetting.new(params[:profile_setting])
    @profile_setting.community = @current_community

    if @profile_setting.save
      redirect_to admin_profile_settings_path
    else
      flash[:error] = "Profile Setting saving failed"
      render :action => :new
    end
  end
end
