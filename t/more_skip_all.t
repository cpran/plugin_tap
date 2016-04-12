include ../procedures/more.proc

@no_plan()

got$ = "hello"
got  = 10

id1 = Create SpeechSynthesizer: "English", "default"
id2 = Create SpeechSynthesizer: "English", "f5"

@pass: "skip all more tests"

@skip_all: "skip all more tests"

@ok: 0, "failing test with ok"

@is$: got$, "world", "failing string is"

@is: got,  15, "failing numeric is"

@isnt$: got$, "hello", "failing string isnt"

@isnt:  got,  10, "failing numeric isnt"

@like: got$, "ol+", "failing like"

@unlike: got$, "el+", "failing unlike"

@cmp_ok$: got$, "==", "world", "failing string equal cmp ok"

@cmp_ok:  got, "==", 15, "failing numeric equal cmp ok"

@cmp_ok$: got$, ">", "zello", "failing string gt cmp ok"

@cmp_ok:  got, ">", 15, "failing numeric gt cmp ok"

@is_deeply: id1, id2, "failing is deeply with extant objects"

@is_deeply: id1, 0, "failing is deeply with non-extant second term"

@is_deeply: 0, 0, "failing is deeply with non-extant terms"

@is_deeply: 0, id1, "failing is deeply with non-extant first term"

@fail: "failing test with fail"

@ok_selection()

removeObject: id1, id2

@ok_selection()

@done_testing()
