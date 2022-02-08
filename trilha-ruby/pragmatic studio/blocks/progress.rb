def progress

  0.step(100, 10).each do |percent|
    yield(percent)
  end

end
progress { |percent| puts percent }