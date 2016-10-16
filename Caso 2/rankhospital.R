rankhospital<-function(estado, resultado,num="mejor"){
  #Lectura de datos
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  filas<-nrow(outcome)
  columna<-vector("numeric")
  estados <- levels(factor(outcome[, 7]))
  
  #Revisión de la validez de estado y resultado
  if (estado %in% estados == F){
    stop("Estado inválido")
  }
  if (!((resultado == "ataque")|(resultado == "falla")| (resultado == "neumonía"))){
    stop("Resultado inválido")
  }
  if (resultado == "ataque") {
    columna <- 11
  } else if (resultado == "falla") {
    columna <- 17
  } else if (resultado == "neumonía") {
    columna <- 23
  } 
  # Regresa el nombre del hospital con el puesto dado de la tasa más
  # baja de mortalidad de 30 días
  Tasa <- matrix(outcome[,columna],nrow=filas,ncol=1)
  outcome[,columna] <-suppressWarnings(as.numeric(Tasa)) #NA coercionados
  Nombre <- outcome[grep(estado,outcome$State),] #busca coincidencias con el argumento
  #para cada elemento de un vector de caracteres
  Ordenar <- Nombre[order(Nombre[,columna], Nombre[,2], na.last=NA),]
  if(num == "mejor") {
    Ordenar[1, 2]
  } else if(num == "peor") {
    Ordenar[nrow(Ordenar), 2]
  } else{
    Ordenar[num, 2]
  }
}
  
rankhospital("TX", "falla", 4)
rankhospital("MD", "ataque", "peor")
rankhospital("MN", "ataque", 5000)
