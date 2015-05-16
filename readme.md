testsimple
==========

Description
-----------

A simple test framework for Praat, using TAP. Functionality based heavily from [Test::Simple](https://metacpan.org/pod/Test::Simple).

Usage:

    include /path/to/test_simple.proc

    @plan(4)
    # or @no_plan() if you don't know how many tests you'll run

    @ok(1, "1 is true")
    @ok(numberOfSelected("Sound"), "have selected sounds")
    @ok(selected("TextGrid"), "have selected textgrid")
    @ok( if selected$("Sound") = "tone" then 1 else 0 fi,
      ... "selected sound is tone")

    @done_testing()

Requirements
------------

None
