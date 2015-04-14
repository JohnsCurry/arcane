module ApplicationHelper
  def wrap(s, width=78)
    s.gsub(/(.{1,#{width}})(\s+|\Z)/, "\\1<br>").html_safe
  end
  
  def radio_input(average, skill_id, name, val, comp)
    if average == "no ratings yet"
      checked_or_not = {:type => "radio", :id => "#{skill_id} star#{val}", :name => "rating #{name}", :value => "#{val}"}
    elsif average.to_f >= comp && average.to_f <= val
      checked_or_not = {:type => "radio", :checked => "checked", :id => "#{skill_id} star#{val}", :name => "rating #{name}", :value => "#{val}"}
    else
      checked_or_not = {:type => "radio", :id => "#{skill_id} star#{val}", :name => "rating #{name}", :value => "#{val}"}
    end
    return checked_or_not
  end
  
end
