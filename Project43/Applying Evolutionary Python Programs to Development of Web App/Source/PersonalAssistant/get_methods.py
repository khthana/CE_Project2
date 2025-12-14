def get_methods(File):
    __result = {}
    __f = open(File, 'r')
    __content = __f.read()
    __f.close()
    __index_i = 0
    __index_j = 0
    while __index_i >= 0:
        __index_i = find(__content, '\n    d' + 'ef ', __index_j)
        __index_j = find(__content, '(', __index_i)
        if __index_i >= 0:
            __method_name = __content[__index_i + 9:__index_j]
            if __method_name[:2] != '__':
                __temp_text1 = '#' + __method_name + '_comment#'
                __temp_text2 = '#' + __method_name + '_modify#'
                __temp_text3 = '#' + __method_name + '_end#'
                __index_ii = find(__content, __temp_text1, __index_j)
                if __index_ii != -1:
                    __index_ii = __index_ii + len(__temp_text1)
                    __index_jj = find(__content, __temp_text3, __index_ii)
                    __method_context = split(__content[__index_ii:__index_jj], __temp_text2)
                    for __temp_index in range(len(__method_context)):
                        __method_context[__temp_index] = eval(strip(__method_context[__temp_index]))
                    __result[__method_name] = __method_context
                else:
                    if __result.has_key(__method_name):
                        del __result[__method_name]
    return __result
