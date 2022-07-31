#alias:new ls exa '--sort=type' --icons
edit:add-var ls~ {|@_args|  exa '--sort=type' --icons $@_args }
