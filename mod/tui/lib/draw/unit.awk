function draw_unit_page_begin( v, page_row ) {
    return ( int((v-1) / page_row) * page_row ) + 1
}

function draw_unit_page_end( v, page_row, data_max ) {
    v = draw_unit_page_begin( v, page_row )
    v = v + page_row - 1
    return ( v > data_max ) ? data_max : v
}

function draw_unit_truncate_string( str, w,      v ){
    str = draw_text_first_line( str )
    v = wcstruncate_cache( str, w )
    if (v == str)  return str space_rep(w - wcswidth_cache( str ))
    return wcstruncate_cache( v, w-1 ) "…"
}

