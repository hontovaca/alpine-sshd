local function longrun(name, run, ...)
  rc[name]:merge {
    type = "longrun",
    run = util.realign([[
      #!/usr/bin/execlineb -P
      fdmove -c 2 1
    ]] .. util.realign(run)),
  }
  for i,s in global.ipairs({...}) do
    rc[s]:merge { contents = name }
  end
end

longrun("crond", "crond -fd8", 2, 3)
longrun("syslogd", "syslogd -nO-", 1, 2, 3)
