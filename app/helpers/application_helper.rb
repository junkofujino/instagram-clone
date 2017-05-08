module ApplicationHelper
  def profile_img(user,page)
    return image_tag(user.avatar, alt: user.name, class:'img-circle') if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end

    if page == 'blogs'
     image_tag(img_url, alt: user.name, class:'img-circle')
    else
     image_tag(img_url, alt: user.name)
    end
  end
end
