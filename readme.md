testsimple [![build badge][badge]][build]
==========

Description
-----------

A simple test framework for Praat, using the [Test Anything Protocol][tap].
Its functionality is based heavily on that of [Test::Simple][]

[tap]: http://testanything.org
[Test::Simple]: https://metacpan.org/pod/Test::Simple

Synopsis
--------

    include /path/to/test_simple.proc

    # Abort testing in critical case
    if cricital_failure
      @bail_out("Testing is pointless!")
    endif

    # Plan your test suite
    @plan(total_tests)
    # or @no_plan() if you don't know how many tests you'll run

    # Run your tests
    # @ok() interprets the first argument as boolean
    # and the second argument as the name of the test
    @ok(1, "1 is true")
    @ok(if selected$("Sound") == "tone" then 1 else 0 fi,
      ... "selected sound is tone")
    # or more succinctly
    @ok(selected$("Sound") == "tone",
      ... "selected sound is tone")

    # You can also use formulas
    @ok_formula("selected$(""Sound"") == ""tone""",
      ... "selected sound is tone")

    # Skip n tests that are known to fail
    @skip(2, "skip next two tests)
    @ok(0, "have selected sounds")  ; will "succeed" anyway
    @ok(1, "defibrollate braggles") ; also skipped

    @ok(0, "failing test")          ; no longer skipped!

    # You can skip all tests until a certain point
    @skip(undefined, "skip some more tests")
    for i to randomInteger(5,10)
      @ok(0, "")                    ; all these will be skipped
    endfor
    @end_skip()
    @ok(0, "failing test")          ; this one will fail!

    # You can mark tests as work in progress
    # Failing a TODO test is ok, but passing it is a nice bonus!
    @todo(1, "how do I brime a brock?")
    @ok(brimed$, "try briming")

    # Or mark a whole block as TODO
    @todo(undefined, "more tests as TODO")
    for i to randomInteger(5,10)
      @ok(0, "")                    ; all these will be marked as TODO
    endfor
    @end_todo()

    # Mark the end of your suite
    @done_testing()

Requirements
------------

None

[badge]: https://ci.gitlab.com/projects/2843/status.png?ref=master
[build]: https://ci.gitlab.com/projects/2843
