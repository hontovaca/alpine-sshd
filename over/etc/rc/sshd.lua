rc.sshd:merge {
  type = "longrun",
  run = util.realign [[
    #!/usr/bin/execlineb -P
    fdmove -c 2 1
    if { ssh-keygen -A }
    /usr/sbin/sshd -De
  ]],
}
rc[3]:merge { contents = "sshd" }
