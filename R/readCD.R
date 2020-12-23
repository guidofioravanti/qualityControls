#' Read precipitation and temperature data for quality controls
#'
#' @param x A string name file
#' @return A tibble with columns yy (year), mm (month), dd (day) and as many columns as the number of stations
#' @export
readCD<-function(x){

  if(missing(x) || !is.character(x)) stop("x deve essere una stringa di carattere")

  TIPI<-readr::cols(yy=readr::col_integer(),mm=readr::col_integer(),dd=readr::col_integer(),.default = readr::col_double())

  message("Uso il separatore di campo ,")
  suppressWarnings({readr::read_delim(file=x,delim=";",col_names = TRUE,col_types = TIPI)->dati})

  if(ncol(dati)<3){
    message("Il separatore di campo , non valido provo con il separatore di campo ;")
    readr::read_delim(file=x,delim=",",col_names = TRUE,col_types = TIPI)->dati
  }

  dati

}
