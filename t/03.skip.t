include ../procedures/test_simple.proc

@no_plan()

@ok(1, "")
@ok(1, "")

@skip(2, "skipping failing tests")
@ok(0, "this should not display")
@ok(0, "")

@ok(1, "this should display")
@ok(1, "")

@done_testing()
