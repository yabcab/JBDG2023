draw_text(3,500 + veroff,"Ver. DEV-" + date_date_string(GM_build_date))

draw_set_color(c_black)
draw_set_alpha(rectalph)
draw_rectangle(0,0,960,540,false)
draw_set_alpha(1)
draw_set_color(c_white)
draw_self()