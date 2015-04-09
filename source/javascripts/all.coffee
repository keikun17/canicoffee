#= require_tree .
#= require 'moment'

tick = ->
  now = new moment()
  document.getElementById('timenow').innerHTML = now.format("hh:mm:ssa")

  woke_up_at = new moment( document.getElementById('wake').value , 'hh:mm')


  if woke_up_at.format() != 'Invalid date'

    if woke_up_at > now
      console.log('.')
      woke_up_at = woke_up_at.subtract(1, 'day')

    _woke = woke_up_at.clone()
    start_first_coffee_cycle = _woke.add(3, 'hours')
    _woke = woke_up_at.clone()
    end_first_coffee_cycle = _woke.add(5.5, 'hours')

    _woke = woke_up_at.clone()
    start_second_coffee_cycle = _woke.add(7.5, 'hours')
    _woke = woke_up_at.clone()
    end_second_coffee_cycle = _woke.add(12, 'hours')

    window.woke_up_at = woke_up_at.format()
    window.now = now

    document.getElementById('recommendations').style.visibility = 'visible'
    document.getElementById('first_coffee_cycle').innerHTML = "#{start_first_coffee_cycle.format('hh::mm a')} to #{end_first_coffee_cycle.format('hh::mm a') }"
    document.getElementById('second_coffee_cycle').innerHTML = "#{start_second_coffee_cycle.format('hh::mm a')} to #{end_second_coffee_cycle.format('hh::mm a') }"
  else
    document.getElementById('recommendations').style.visibility = 'hidden'


ticker = setInterval(tick, 1000)


# 06:00am    0      X
# 07:00am    1      X
# 08:00am    2      X
# 09:00am    3      X
# 08:30am    3.5    O
# 10:00am    4      O
# 11:00am    5      O
# 11:30am    5.5    O
# 12:00nn   6j      X
# 01:00pm   7       X
# 01:30pm   7.5     O
# 02:00pm   8       O
# 03:00pm   9       O
# 04:00pm   10      O
# 05:00pm   11      O
# 06:00pm   12      X
# 07:00pm   13      X
# 08:00pm   14      X



