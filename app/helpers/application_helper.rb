module ApplicationHelper
  def safe_external_url(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil? ? url : "#"
  rescue URI::InvalidURIError
    "#"
  end
end
