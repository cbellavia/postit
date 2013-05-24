module ApplicationHelper
  def make_url(url)
    return url.start_with?("http://") ? url : "http://#{url}"
  end
end
