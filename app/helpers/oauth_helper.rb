module OauthHelper
  def auth_provider(name)
    link_to image_tag("icons/#{name}.png"),
    user_omniauth_authorize_path(name),
    :id => "sign_in_with_#{name}"
  end

  def auth_providers(*names)
    names.each do |name|
      concat(link_to(image_tag("icons/#{name}_32.png"),
      user_omniauth_authorize_path(name),
      :id => "sign_in_with_#{name}"))
    end
    nil
  end

end
