include ../procedures/test_simple.proc

@no_plan()

@ok(1, "")

@skip(undefined, "skipping until done_skipping()")
@ok(0, "this should not display")

@done_skipping()
@ok(1, "")

@done_testing()
