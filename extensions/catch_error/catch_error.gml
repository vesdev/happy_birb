#define catch_error_init
/// () : Should be ran before any other calls
return catch_error_init_raw();

#define catch_error_set_prompt
/// (catch_error_prompt_kind, ?message, ?title, ?MSDN_MessageBox_type)
var l_kind = argument[0];
var l_text, l_title, l_flags;
if (argument_count > 1) {
    l_text = argument[1];
    if (!is_string(l_text)) l_text = "";
} else l_text = "";
if (argument_count > 2) {
    l_title = argument[2];
    if (!is_string(l_title)) l_title = "";
} else l_title = "";
if (argument_count > 3) l_flags = real(argument[3]); else l_flags = -1;
return catch_error_set_prompt_raw(l_kind, l_text, l_title, l_flags);

#define catch_error_set_dump_path
/// (?path) : Changes where to save a file with error message
var l_path;
if (argument_count > 0) {
    l_path = argument[0];
    if (is_string(l_path)) {
        if(string_ord_at(l_path, 2) == ord(":") // "X:\path"
        || string_ord_at(l_path, 1) == 92 && string_ord_at(l_path, 2) == 92) { // "\\path"
            // OK, that's an absolute path
        } else {
            // as this is going into cache directory, make sure it exists or what
            var l_dir = filename_dir(l_path);
            if (l_dir != "" && !file_exists(l_path) && !directory_exists(l_dir)) {
                var l_file = file_text_open_write(l_path);
                if (l_file < 0) {
                    show_debug_message("[catch_error] It doesn't seem like your dump path is valid");
                } else {
                    file_text_close(l_file);
                    file_delete(l_path);
                }
            }
            l_path = game_save_id + l_path;
        }
    } else l_path = "";
} else l_path = "";
catch_error_set_dump_path_raw(l_path);

#define catch_error_set_exec
/// (?path, ?params) : Changes what executable to run in case of fatal error
var l_path, l_args;
if (argument_count > 0) {
    l_path = argument[0];
    if (!is_string(l_path)) l_path = "";
} else l_path = "";
if (argument_count > 1) {
    l_args = argument[1];
    if (!is_string(l_args)) l_args = "";
} else l_args = "";
return catch_error_set_exec_raw(l_path, l_args);

#define catch_error_set_newer
/// (mode:catch_error_set_newer_*)
var l_val = argument0;
var l_result = catch_error_set_newer_raw(l_val);
if (l_result == -2) {
    var l_fatal = catch_error_get_fatal();
    catch_error_set_fatal(catch_error_fatal_ignore);
    catch_error_fatal_force_raw();
    show_error("[catch_error_set_newer] This is a dummy error to let us hook the handler", true);
    catch_error_set_fatal(l_fatal);
    l_result = catch_error_set_newer_raw(l_val);
}
return l_result;