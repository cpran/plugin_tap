include ../procedures/more.proc

@no_plan()

# Various ways to say "ok"
got$ = "hello"
got  = 10

id1 = Create SpeechSynthesizer: "English", "default"
id2 = Create SpeechSynthesizer: "English", "f5"

@is$:   got$, "hello", "is matches string"
@todo: 1, "failing test"
@is$:   got$, "world", "failing test"
@ok: !ok.value, "is fails with different strings"

@is:    got,  10, "is matches numeric"
@todo: 1, "failing test"
@is:    got,  15, "failing test"
@ok: !ok.value, "is fails with different numerics"

@isnt$: got$, "world", "isnt matches with different strings"
@todo: 1, "failing test"
@isnt$: got$, "hello", "failing test"
@ok: !ok.value, "isnt fails with equal strings"

@isnt:  got,  15, "isnt matches with different numerics"
@todo: 1, "failing test"
@isnt:  got,  10, "failing test"
@ok: !ok.value, "isnt fails with equal numerics"

@is_true:  got, "positive number is true"
@is_true:  got * -1, "negative number is true"
@todo: 1, "failing test"
@is_true:  0, "failing test"
@ok: !ok.value, "zero is not true"

@is_false:  0, "zero is false"
@todo: 1, "failing test"
@is_false:  got, "failing test"
@ok: !ok.value, "positive number is not false"
@todo: 1, "failing test"
@is_false:  got * -1, "failing test"
@ok: !ok.value, "negative number is not false"

# Print an explicit comment to the TAP stream
@diag: "print a comment to the stream"

@like: got$, "el+", "like matched a regular expression"
@todo: 1, "failing test"
@like: got$, "ol+", "failing test"
@ok: !ok.value, "like did not find unmatching expression"

@unlike: got$, "ol+", "unlike passes with failing regex"
@todo: 1, "failing test"
@unlike: got$, "el+", "failing test"
@ok: !ok.value, "unlike fails with matching expression"

@cmp_ok$: got$, "==", "hello", "cmp matches equal strings as equal"
@todo: 1, "failing test"
@cmp_ok$: got$, "==", "world", "failing test"
@ok: !ok.value, "cmp fails matching different strings as equal"

@cmp_ok:  got, "==", 10, "cmp matches equal numerics as equal"
@todo: 1, "failing test"
@cmp_ok:  got, "==", 15, "failing test"
@ok: !ok.value, "cmp fails matching different numerics as equal"

@cmp_ok$: got$, ">", "abc", "cmp matches strings as gt"
@todo: 1, "failing test"
@cmp_ok$: got$, ">", "zello", "failing test"
@ok: !ok.value, "cmp fails with failing string gt"

@cmp_ok:  got, ">",  5, "cmp matches numerics as gt"
@todo: 1, "failing test"
@cmp_ok:  got, ">", 15, "failing test"
@ok: !ok.value, "cmp fails with failing numeric gt"

@is_deeply: id1, id1, "same objects are the same"

@todo: 1, "failing test"
@is_deeply: id1, id2, "failing test"
@ok: !ok.value, "different objects are different"

@todo: 1, "failing test"
@is_deeply: id1, 0, "is deeply nonexistent"
@ok: !ok.value, "is deeply fails with non existent second term"

@todo: 1, "failing test"
@is_deeply: 0, 0, "failing test"
@ok: !ok.value, "is deeply fails with non existent terms"

@todo: 1, "failing test"
@is_deeply: 0, id1, "failing test"
@ok: !ok.value, "is deeply fails with non existent first term"

@pass: "automatically pass a test"
@todo: 1, "failing test"
@fail: "failing test"
@ok: !ok.value, "automatically fail a test"

@todo: 1, "failing test"
@ok_selection()
@ok: !ok.value, "ok selection fails with remaining objects"

removeObject: id1, id2
# @BAIL_OUT: "bail out"

@ok_selection()

@done_testing()
