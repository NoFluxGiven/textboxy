// Init basics
typewriterPos = 0;
textSpeed = tby_default_text_speed;
smoothness = 0;
waitTimer = 0;
var pos/*:TbyPos*/ = self.pos


//Add camera offset
//Calc max size (the custom box width if specified or the whole game screen)
var cam = view_camera[0]
if (cam != -1) {
    var padding = tby_tile_size;
    pos[@TbyPos.x] = camera_get_view_x(cam) + pos[TbyPos.x] + padding;
    pos[@TbyPos.y] = camera_get_view_y(cam) + pos[TbyPos.y] + padding;
}

//message confirmation dot speed
image_speed = tby_confirmation_blink_speed;

textScribble = scribble_create(textRaw, -1, pos[TbyPos.width], tby_default_color, tby_default_font, fa_left);

//set origin point of box to topleft
scribble_set_box_alignment(textScribble); 

scribble_typewriter_in(textScribble, textSpeed, SCRIBBLE_TYPEWRITER_PER_CHARACTER, smoothness);

tby_state_switch("Writing")