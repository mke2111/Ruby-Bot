def dots
  one = '.'
  i = 1
  three_dots = 5
  while i < three_dots
    sleep(0.5)
    if i == 1
      print one.to_s
    elsif i == 2
      print (one ).to_s
    else
      print (one ).to_s
    end
    sleep(0.5)
    i += 1
  end
end
