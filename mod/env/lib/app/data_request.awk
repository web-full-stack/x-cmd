{jiparse_after_tokenize( O, $0 )}

END{
    l = split(ARGS, arr, " ")
    _kp = SUBSEP "\"1\""
    for (i=1; i<=l; ++i) _kp = _kp SUBSEP jqu(arr[i])
    l = O[ _kp L ]
    for (i=1; i<=l; ++i){
        key = O[ _kp,  i ]

        desc = O[_kp S key S "\"info\"" S "\"desc\"" S "\""region"\"" ]
        if(desc != ""){
            jdict_put(O, _kp S key S "\"info\"", "\"desc\"" , desc)
        }else {
            desc = O[_kp S "\"desc\"" S "\""region"\"" ]
            jdict_put(O, _kp S key S "\"info\"", "\"desc\"" , desc)
        }

        homepage = O[_kp S "\"homepage\""]
        if (homepage != "") jdict_put(O, _kp S key S "\"info\"", "\"homepage\"" , homepage)

        size = O[_kp S key S "\"info\"" S "\"size\"" S "\""os"/"arch"\"" ]
        if (size != "")jdict_put(O, _kp S key S "\"info\"", "\"size\"" , size)
        else jdict_put(O, _kp S key S "\"info\"", "\"size\"" ,  "\"Unknow\"")

        license = O[_kp S "\"license\""]
        if (license != "") jdict_put(O, _kp S key S "\"info\"", "\"license\"" , license)

        print  juq(key) "\003\004" jstr1(O, _kp S key S "\"info\"")
    }
}
