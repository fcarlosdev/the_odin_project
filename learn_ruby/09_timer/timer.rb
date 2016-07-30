class Timer

  def initialize
    @seconds = 0
  end

  def seconds=(seconds)
    @seconds = seconds
  end

  def seconds
    @seconds
  end

  def time_string
    hours   = (@seconds / 3600).to_i
    minutes = (@seconds/60 - hours * 60)
    seconds = (@seconds - (minutes * 60 + hours * 3600))
    @time_string = "%02d" % hours + ":" + "%02d" % minutes + ":" + "%02d" % seconds
  end
end
