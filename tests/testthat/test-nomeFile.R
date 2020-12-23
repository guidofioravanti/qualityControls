test_that("name is a string", {
  expect_error(readCD(1),"x deve essere una stringa di carattere")
  expect_error(readCD(TRUE),"x deve essere una stringa di carattere")
  expect_error(readCD(data.frame(x=1:10)),"x deve essere una stringa di carattere")
})
