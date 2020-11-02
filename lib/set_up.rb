def dots
  one = '.'
  i = 1
  three_dots = 5
  while i < three_dots
    sleep(0.5)
    print one.to_s if i.is_a? Integer
    sleep(0.5)
    i += 1
  end
end




