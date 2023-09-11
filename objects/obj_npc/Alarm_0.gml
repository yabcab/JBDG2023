for (var i = 0; i < max_texts; i++)
	if string_copy(text[i],1,1) != "@"
		text[i] += " " // fixes an edge case with line wrapper
		
switch npcid
{
	case npcs.lemonhead:
	{
		drawnbg = spr_textbg_lemonhead
		talkspr = spr_lemonhead_talk
		idlespr = spr_lemonhead_idle
	}
	break;
	case npcs.sadguy:
	{
		drawnbg = spr_textbg_sadguy
		talkspr = spr_sadguy_talk
		idlespr = spr_sadguy_idle
	}
	break;
	case npcs.badfather:
	{
		drawnbg = spr_textbg_father
		talkspr = spr_father_talk
		idlespr = spr_father_idle
	}
	break;
	case npcs.updog:
	{
		drawnbg = spr_textbg_updog
		talkspr = spr_updog_talk
		idlespr = spr_updog_idle
	}
	break;
	
	case npcs.redcritter:
	{
		drawnbg = spr_textbg_redcritter
		talkspr = spr_redcritter_talk
		idlespr = spr_redcritter_idle
	}
	break;
}