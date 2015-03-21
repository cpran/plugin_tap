form Run tests...
  sentence Test_directory "./t"
endform

test_directory$ = test_directory$ + if right$(test_directory$) = "/" then "" else "/" fi
deleteFile: test_directory$ + ".tap"

tests = Create Strings as file list: "tests", test_directory$ + "/*t"
n = Get number of strings

appendFileLine: ".tap", "# Preparing to run " + string$(n) + " test sets"

for i to n
  selectObject: tests
  script$ = Get string: i
  runScript:  test_directory$ + script$
endfor
removeObject: tests

# Process TAP file
# TODO
# deleteFile: tap$
