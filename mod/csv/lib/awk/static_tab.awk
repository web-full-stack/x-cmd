function parse_item(v, w, sep,       item, s){
    item = wcstruncate(v, w)
    s = space_str(w)
    if (v == item)  return wcstruncate(item s, w) sep
    else            return wcstruncate(item, w-1) "…" sep
}

function output(s){
    printf UI_LINEWRAP_DISABLE > "/dev/stderr"
    print s
    printf UI_LINEWRAP_ENABLE > "/dev/stderr"
}

function space_str(w,       s){
    if ( (s = SPACE_STR[ w ]) != "" ) return s
    return SPACE_STR[ w ] = str_rep( " ", w )
}

BEGIN{
    PROPORTION = ENVIRON[ "PROPORTION" ]
    COLUMNS = ENVIRON[ "COLUMNS" ]
    SEP = "   "

    if (PROPORTION != "") IS_STREAM = csv_parse_width(arr, PROPORTION, COLUMNS, ",")
    CUSTOM_LEN = arr[L]

    csv_irecord_init()
    while ( (c = csv_irecord( o )) > 0 ) {
        o[ L L ] = c
        o[ L ] = CSV_IRECORD_CURSOR

        if (IS_STREAM == false) continue
        _return_text = ""
        for (i=1; i<=CUSTOM_LEN; ++i)
            _return_text = _return_text parse_item( o[ S CSV_IRECORD_CURSOR, i ], arr[ i, "width" ], SEP)
        output( _return_text )
    }
    csv_irecord_fini()
}

END{
    if (IS_STREAM == true) exit(0)

    l = o[ L ]
    c = ( CUSTOM_LEN != "" ) ? CUSTOM_LEN : o[ L L ]
    for (i=1; i<=l; ++i){
        for (j=1; j<=c; ++j){
            if (arr[ j, "CUSTOM_WIDTH" ]) continue
            w = wcswidth( o[ S i, j ] )
            if (arr[ j, "width" ] < w) arr[ j, "width" ] = w
        }
    }

    for (i=1; i<=l; ++i){
        _return_text = ""
        for (j=1; j<=c; ++j)
            _return_text = _return_text parse_item(o[ S i, j ], arr[ j, "width" ], SEP)
        output( _return_text )
    }
}
