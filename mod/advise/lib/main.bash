# shellcheck shell=bash disable=SC2207,2206,2034

___x_cmd_advise_run(){
    [ -z "$___X_CMD_ADVISE_RUN_CMD_FOLDER" ] && ___X_CMD_ADVISE_RUN_CMD_FOLDER="$___X_CMD_ADVISE_TMPDIR"
    local name="${1:-${COMP_WORDS[0]}}"
    local ___X_CMD_ADVISE_RUN_FILEPATH_;  ___x_cmd_advise_run_filepath_ "$name" || return 1
    [ "$___X_CMD_ADVISE_RUN_CMD_FOLDER" != "$___X_CMD_ADVISE_MAN_XCMD_FOLDER" ] || ___x_cmd_advise___load_xcmd_advise_util_file "$name"

    # Only different from main.3.bash, for words in COMP_WORDBREAKS
    if [ -z "$___X_CMD_ADVSIE_SHELL_BASH_LT_4_2" ]; then
        local last="${COMP_WORDS[COMP_CWORD]}"
        local tmp=
        case "$last" in
            \"*|\'*)
                COMP_LINE="${COMP_LINE%"$last"}"
                tmp=( $COMP_LINE ); tmp+=("$last")
                COMP_WORDS=("${tmp[@]}")
                COMP_CWORD="$(( ${#tmp[@]}-1 ))"
                ;;
        esac
        # [ "${COMP_LINE% }" = "${COMP_LINE}" ] || tmp+=( "" )        # Ends with space
    fi

    # Used in `eval "$candidate_exec"`
    local cur="${COMP_WORDS[COMP_CWORD]}"
    COMP_WORDS=("${COMP_WORDS[@]:0:$((COMP_CWORD+1))}")

    local candidate_arr; local candidate_exec_arr; local candidate_nospace_arr;
    local candidate_exec=; local offset=; local ___X_CMD_ADVISE_RUN_SET_NOSPACE=; local candidate_prefix=
    eval "$(___x_cmd_advise_get_result_from_awk "$___X_CMD_ADVISE_RUN_FILEPATH_")" 2>/dev/null

    local IFS="$___X_CMD_ADVISE_IFS_INIT"
    local old_cur="$cur"
    cur="${cur#"$candidate_prefix"}"
    [ -z "$candidate_exec" ] || eval "$candidate_exec" 2>/dev/null
    [ -z "$candidate_exec_arr" ] || candidate_arr+=( "${candidate_exec_arr[@]}" )
    COMPREPLY+=( $( ___x_cmd_advise_run___compgen -W "${candidate_arr[*]}" -- "$cur" | uniq ) )
    [ -z "$candidate_nospace_arr" ] || COMPREPLY+=( $( ___X_CMD_ADVISE_RUN_SET_NOSPACE=1 ___x_cmd_advise_run___compgen -W "${candidate_nospace_arr[*]}" -- "$cur" ) )
    ___x_cmd_advise___ltrim_bash_completions "$old_cur" "@" ":" "="
}

___x_cmd_advise_run___compgen(){
    if [ -z "$___X_CMD_ADVISE_RUN_SET_NOSPACE" ]; then
        compgen -S " " ${candidate_prefix:+"-P"} ${candidate_prefix:+"$candidate_prefix"} "$@"
        return
    fi
    compgen ${candidate_prefix:+"-P"} ${candidate_prefix:+"$candidate_prefix"} "$@"
}
