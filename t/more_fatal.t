include ../../plugin_tap/procedures/more.proc

@plan: 2

writeFile: "fatal.praat"
appendFileLine: "fatal.praat", "include ../../plugin_tap/procedures/more.proc"
appendFileLine: "fatal.praat", ""
appendFileLine: "fatal.praat", "@no_plan()"
appendFileLine: "fatal.praat", "appendInfo: ""# """
appendFileLine: "fatal.praat", "@ok: 0, ""failing test"""
appendFileLine: "fatal.praat", "test.fatal = 1"
appendFileLine: "fatal.praat", "@_start_test()"
appendFileLine: "fatal.praat", ""
appendFileLine: "fatal.praat", "clearinfo"
appendFileLine: "fatal.praat", "# Disable bail out command"
appendFileLine: "fatal.praat", "appendInfo: ""# """
appendFileLine: "fatal.praat", "@_end_test()"
appendFileLine: "fatal.praat", "appendInfoLine: """""
nocheck runScript: "fatal.praat"

@like: info$(), "^# Bail out!",
  ... "failing test while fatal bails out"

writeFile: "fatal.praat"
appendFileLine: "fatal.praat", "include ../../plugin_tap/procedures/more.proc"
appendFileLine: "fatal.praat", "@no_plan()"
appendFileLine: "fatal.praat", "appendInfo: ""# """
appendFileLine: "fatal.praat", "@ok: 0, ""failing test"""
appendFileLine: "fatal.praat", "@_start_test()"
appendFileLine: "fatal.praat", ""
appendFileLine: "fatal.praat", "clearinfo"
appendFileLine: "fatal.praat", "# Disable bail out command"
appendFileLine: "fatal.praat", "appendInfo: ""# """
appendFileLine: "fatal.praat", "@_end_test()"
appendFileLine: "fatal.praat", "appendInfoLine: """""
nocheck runScript: "fatal.praat"

@unlike: info$(), "^# Bail out!",
  ... "failing test while not fatal does not bail out"

deleteFile: "fatal.praat"

@done_testing()
