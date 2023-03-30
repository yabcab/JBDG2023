//if speechbubble
//	my_speechbubble = instance_create_layer(bbox_left - 25,bbox_top - 25,"Instances_outlinedblack",obj_npcspeechbubble)
	
textbox_show = false
text_selected = 0
max_texts = 0
text = []
for (var i = 0; i < 10; i++)
{
	text[i] = ""
	//job_id[i] = 0
	//job_name[i] = "NOTEXT"
}
//job_count = 1
textcopy = ""
textcopy_timer = 0
text_spot = 1

//show_job_menu = false

textbox_yoff = 100

speaking = false

//435y
surf = surface_create(960,105)
drawnbg = spr_textbg_placeholder
xscroll = 0
yscroll = 0

npcid = npcs.lemonhead
enum npcs
{
	lemonhead,
	badfather,
	sadguy,
}
alarm[0] = 1
talkspr = sprite_index
idlespr = sprite_index