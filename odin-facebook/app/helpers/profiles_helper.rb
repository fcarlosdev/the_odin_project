module ProfilesHelper

  def to_yes_no(value)
    return "Yes" if value
    "No"
  end
  
end
