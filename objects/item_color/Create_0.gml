// Inherit the parent event
event_inherited();
col = 0

/*

//Part_item_color
_ps = part_system_create();
part_system_depth(_ps, depth-1)
part_system_draw_order(_ps, true);

_ptype1 = part_type_create();
part_type_shape(_ptype1, pt_shape_sphere);
part_type_size(_ptype1, 0.3, 0.5, 0, 0);
part_type_scale(_ptype1, 1, 1);
//part_type_speed(_ptype1, 0.2, 1, 0, 0);
part_type_direction(_ptype1, 0, 360, 0, 0);
//part_type_gravity(_ptype1, 0.04, 270);
part_type_orientation(_ptype1, 0, 360, 0, 0, false);
part_type_color3(_ptype1, $FFFFFF, col, col);
part_type_alpha3(_ptype1, 1, 1, 0.3);
part_type_blend(_ptype1, true);
part_type_life(_ptype1, 50, 80);

_pemit1 = part_emitter_create(_ps);
var t = 8
part_emitter_region(_ps, _pemit1, -t, t, -t, t, ps_shape_ellipse, ps_distr_linear);
part_emitter_stream(_ps, _pemit1, _ptype1, -8);

