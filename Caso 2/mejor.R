mejor<-function(estado, resultado){
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
  #Regresa el nombre del hospital con la tasa m�s baja en 30 d�as
  Tasa <- matrix(outcome[,columna],nrow=filas,ncol=1)
  outcome[,columna] <-suppressWarnings(as.numeric(Tasa)) #NA coercionados
  Nombre <- outcome[grep(estado,outcome$State),] #busca coincidencias con el argumento
  #para cada elemento de un vector de caracteres
  Ordenar <- Nombre[order(Nombre[,columna], Nombre[,2], na.last=NA),]#Quita NAs
  Ordenar[1,2]
}
mejor("TX", "falla")
mejor("MD","ataque")
mejor("MD","neumon�a")
mejor("BB","ataque")
mejor("NY","atake")
  
 