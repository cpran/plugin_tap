include ../../plugin_tap/procedures/more.proc
include ../../plugin_utils/procedures/try.proc

@plan: 2

# If no object is selected, an exiting script fails
# despite best efforts of try.proc
hack = Create TextGrid: 0, 1, "more fatal", ""

call try
  ... include ../../plugin_tap/procedures/simple.proc \n
  ... @no_plan()                                      \n
  ... appendInfo: "# "                                \n
  ... @ok: 0, "failing test"                          \n
  ... test.fatal = 1                                  \n
  ... @_start_test()                                  \n
  ...                                                 \n
  ... clearinfo                                       \n
  ... # Disable bail out command                      \n
  ... appendInfo: "# "                                \n
  ... @_end_test()                                    \n
  ... appendInfoLine: ""                              \n

@like: info$(), "^# Bail out!",
  ... "failing test while fatal bails out"

call try
  ... include ../../plugin_tap/procedures/simple.proc \n
  ... @no_plan()                                      \n
  ... appendInfo: "# "                                \n
  ... @ok: 0, "failing test"                          \n
  ... @_start_test()                                  \n
  ...                                                 \n
  ... clearinfo                                       \n
  ... # Disable bail out command                      \n
  ... appendInfo: "# "                                \n
  ... @_end_test()                                    \n
  ... appendInfoLine: ""                              \n

removeObject: hack

@unlike: info$(), "^# Bail out!",
  ... "failing test while not fatal does not bail out"

@done_testing()
