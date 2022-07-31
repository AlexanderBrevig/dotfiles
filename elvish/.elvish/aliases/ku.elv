#alias:new ku kubectl config unset current-context
edit:add-var ku~ {|@_args|  kubectl config unset current-context $@_args }
