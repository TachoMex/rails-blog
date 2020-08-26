module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    email = user.email.downcase
    hash = Digest::MD5.hexdigest(email)
    url = "https://www.gravatar.com/avatar/#{hash}?size=#{options[:size]}"
    image_tag(url, alt: user.username, class: options[:class])
  end
end
