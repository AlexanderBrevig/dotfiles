function netshoot
         kubectl run -n metrics -i --rm --tty netshoot --image=nicolaka/netshoot  -- /bin/bash
end
