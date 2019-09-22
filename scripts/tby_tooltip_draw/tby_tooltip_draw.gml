/// @param _tooltip_name
/// @param _tx
/// @param _ty
var _tooltip_name = argument0, _tx = argument1, _ty = argument2;

var _text = tby_tooltip_get_text(_tooltip_name);
var _box = scribble_get_box(_text, 0, 0); // just for relative width / height

var _skin = tby_tooltip_get_skin(_tooltip_name);
var _padding = _skin[TbySkin.TileSize]

var _tw = tby_scribble_get_box_width(_box)
var _th = tby_scribble_get_box_height(_box)
var _coordinates = tby_tooltip_calculate_offset(_tx, _ty, _tw, _th, sprite_get_height(_skin[TbySkin.Bubble]))

var _dim/*:TbyDim*/ = [_coordinates[0], _coordinates[1], _tw, _th]

var _box_dim = [_dim[TbyDim.x]-_padding,
                _dim[TbyDim.y]-_padding,
				_dim[TbyDim.x]+_dim[TbyDim.width]+_padding,
				_dim[TbyDim.y]+_dim[TbyDim.height]+_padding
				]
//TODO: Allow tooltip skins
//TODO: Remove hard coded tile size
tby_draw_frame(_box_dim[0], _box_dim[1], _box_dim[2], _box_dim[3], 8);
scribble_draw(_text, _dim[TbyDim.x]-1, _dim[TbyDim.y]-1);

//Bubble
if (tby_tooltip_get_draw_bubble_sprite(_tooltip_name)) {
    var _bubble_sprite = tby_array_get(tby_default_skin, TbySkin.Bubble)
    draw_sprite(_bubble_sprite, -1,
	            _box_dim[0]+(_box_dim[2]-_box_dim[0])/2,
				_dim[TbyDim.y]+_dim[TbyDim.height]+_padding)
}