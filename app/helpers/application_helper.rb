module ApplicationHelper

  def fix_date(date)

    date = date.in_time_zone("Eastern Time (US & Canada)")

    date.strftime("%l:%M%P %Z on %D")
    
  end

end
