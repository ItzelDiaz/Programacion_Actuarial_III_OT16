rankhospital<-function(estado, resultado,num="mejor"){
  #Lectura de datos
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  filas<-nrow(outcome)
  columna<-vector("numeric")
  estados <- levels(factor(outcome[, 7]))
  
  #Revisi�n de la validez de estado y resultado
  if (estado %in% estados == F){
    stop("Estado inv�lido")
  }
  if (!((resultado == "ataque")|(resultado == "falla")| (resultado == "neumon�a"))){
    stop("Resultado inv�lido")
  }
  if (resultado == "ataque") {
    columna <- 11
  } else if (resultado == "falla") {
    columna <- 17
  } else if (resultado == "neumon�a") {
    columna <- 23
  } 
  # Regresa el nombre del hospital con el puesto dado de la tasa m�s
  # baja de mortalidad de 30 d�as
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
