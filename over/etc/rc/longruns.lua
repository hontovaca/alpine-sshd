local function longrun(name, run, ...)
  rc[name]:merge {
    type = "longrun",
    run = realign([[
      #!/bin/execlineb -P
      fdmove -c 2 1
    ]] .. realign(run)),
  }
  for i,s in _G.ipairs({...}) do
    rc[s]:merge { contents = name }
  end
end

longrun("crond", "crond -fd8", 2, 3)
longrun("syslogd", "syslogd -nO-", 1, 2, 3)
