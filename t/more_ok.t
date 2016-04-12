include ../procedures/more.proc

@no_plan()

@todo: 1, ""
@ok: 0, "fail"
@ok: !ok.value, "previous test failed"
@ok: 1, "pass"

@todo: 1, ""
@ok_formula: "1-1", "formula fail"
@ok: !ok.value, "previous test failed"
@ok_formula: "0+1", "formula pass"

tg = Create TextGrid: 0, 1, "test", ""
@todo: 1, ""
@ok_selection()
@ok: !ok.value, "previous test failed"
removeObject: tg
@ok_selection()

@done_testing()
