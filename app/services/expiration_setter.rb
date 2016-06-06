class ExpirationSetter

  def self.expiration_options
    ["2 days", "1 day", "12 hours", "6 hours", "1 hour", "30 minutes", "15 minutes"]
  end

  def self.set_expiration(user_expiration)
    case user_expiration
      when "2 days"
        2.days.from_now
      when "1 day"
        1.day.from_now
      when "12 hours"
        12.hours.from_now
      when "6 hours"
        6.hours.from_now
      when "1 hours"
        1.hours.from_now
      when "30 minutes"
        30.minutes.from_now
      else
        15.minutes.from_now
    end
  end
end