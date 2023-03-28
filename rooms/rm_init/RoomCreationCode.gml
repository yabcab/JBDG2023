globalvar controllable; controllable = true // make me false when its time!

//game font
var fontstr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*()_+1234567890-=[]\\{}|;':\",./<>?`~♡☺♢♤♧"
var sep = 0
globalvar fnt_game_boil1; fnt_game_boil1 = font_add_sprite_ext(spr_gamefont_boil1,fontstr,2,sep)
globalvar fnt_game_boil2; fnt_game_boil2 = font_add_sprite_ext(spr_gamefont_boil1,fontstr,2,sep)
globalvar fnt_game; fnt_game = fnt_game_boil1
draw_set_font(fnt_game)

room_goto(rm_intro)