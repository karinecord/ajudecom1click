class Members::SessionsController < Devise::SessionsController

  def new
    super do |resource|
      resource.build_profile_member
    end
  end



  protected
  def after_sign_in_path_for(resource)

  sign_in_url = site_home_path
  if request.referer == sign_in_url
    sign_in_url
  else
    site_profile_dashboard_index_path
  end
end
end