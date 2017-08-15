require 'net/http'
require 'uri'
module HttpHelper
  def self.get_secure(path, decode_json = false)
    uri = URI.parse(path)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    response = https.get(path)
    return decode_json ? ActiveSupport::JSON.decode(response.body) : response.body
  end

  def self.get_secure_status(path)
    uri = URI.parse(path)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    response = https.get(path)
    return response.code
  end

  def self.get(path, decode_json = false)
    uri = URI.parse(path)
    response = Net::HTTP.get(uri)
    return decode_json ? ActiveSupport::JSON.decode(response) : response
  end

  def self.get_status(path)
    begin
      uri = URI.parse(path)
    rescue URI::InvalidURIError => e
      return false
    end
    begin
      req = Net::HTTP.new(uri.host, uri.port)
      req.open_timeout = 5
      req.read_timeout = 5
      req.ssl_timeout = 5
      if (uri.scheme == 'https')
        req.use_ssl = true
        req.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      response = req.get(uri)
      return response.code
    rescue StandardError => e
      puts "get_status error: #{path} - #{e}"
      return 503 if "#{e}" =~ /getaddrinfo/i
      return 504 if "#{e}" =~ /timeout/i
      return false
    end
  end
  
  def self.get_status_head(path)
    begin
      uri = URI.parse(path)
    rescue URI::InvalidURIError => e
      return false
    end
    begin
      req = Net::HTTP.new(uri.host, uri.port)
      req.open_timeout = 5
      req.read_timeout = 5
      req.ssl_timeout = 5
      if (uri.scheme == 'https')
        req.use_ssl = true
        req.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      response = req.head(uri)
      return response.code
    rescue StandardError => e
      puts "get_status_head error: #{path} - #{e}"
      return 503 if "#{e}" =~ /getaddrinfo/i
      return 504 if "#{e}" =~ /timeout/i
      return false
    end
  end

  def self.verify_url(url, times_to_redirect = 0)
    # Returns the new url if the url has a redirect to a valid resource
    # Returns nil if the url returns a 403 or 404 or if it has more than n redirect(s) (to prevent infinite redirect loops)
    # Returns the original url if url leads to (or may lead to) a valid resource
    return if url.blank?
    require "resolv-replace.rb"
    begin
      url = URI.parse(url)
    rescue => e
      p e
      return nil
    end
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == "https")
    begin
      http.start do |http|
        code = http.head(url.request_uri).code
        is_redirect = ["301", "302", "303", "307", "308"].include?(code)
        # Follow redirect as many times as specified in method params
        return HttpHelper.verify_url(http.head(url.request_uri)['location'], times_to_redirect - 1) if is_redirect && times_to_redirect > 0
        # 503 - Service Unavailable - Assume resource exists and service is temporarily unavailable
        return url.to_s if code == "503"
        return nil if ["403", "404"].include?(code)
        return nil if is_redirect && times_to_redirect <= 0
      end
    rescue => e
      # If there is an error, it may be because of the implementation of this method or a server being down -- return url to be safe
      p e
    end
    return url.to_s
  end
end
