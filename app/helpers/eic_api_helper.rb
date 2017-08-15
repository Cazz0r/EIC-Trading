require 'uri'
module EicApiHelper
	EIC_DOMAIN = "http://eicgaming.com"

  def self.get_user(username, password)
  	return if username.blank? || password.blank?
    url = "#{EicApiHelper::EIC_DOMAIN}/api/v1/users.php?username=#{username.gsub('&', '%26')}&password=#{password.gsub('&', '%26')}"
    puts "GET '#{url}'"
    return HttpHelper.get(url, true)
  end

  def self.get_user_from_payload(payload)
  	user = User.find_by_username(payload["user"]["username"]) || User.new
    user.username = payload["user"]["username"]
    user.image_url = payload["user"]["avatar"] unless payload["user"]["avatar"].blank?
    user.rank = payload["user"]["rank"] unless payload["user"]["rank"].blank?
    user.tags = payload["user"]["tags"].join(' ') unless payload["user"]["tags"].blank?
    return user
  end
end