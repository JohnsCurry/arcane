module ApplicationHelper
  def wrap(s, width=78)
    s.gsub(/(.{1,#{width}})(\s+|\Z)/, "\\1<br>").html_safe
  end
end
