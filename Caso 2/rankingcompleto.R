rankingcompleto<-function(resultado,num){
  
  #Lectura de datos
  outcome <- read.csv("outcome-of-care-measures.csv")
  filas<-nrow(outcome)
  Result <- vector()
  ResultFinal<-vector()
  
  #Revisión de la validez de resultado
  if (!((resultado == "ataque")|(resultado == "falla")|(resultado == "neumonía"))){
    stop("Resultado inválido")
  }
  if (resultado == "ataque") {
    columna <- 11
  } else if (resultado == "falla") {
    columna <- 17
  } else if (resultado == "neumonía") {
    columna <- 23
  } 
  
  # Para cada estado, encuentra el hospital con la posición dada. 
  Tasa <- matrix(outcome[,columna],nrow=filas,ncol=1)
  outcome[,columna] <-suppressWarnings(as.numeric(Tasa))
  estados <- levels(outcome[,7])
  outcome[,2] <- as.character(outcome[,2])
  
  for(i in 1:length(estados)) {
    Nombre <- outcome[grep(estados[i],outcome$State),]
    Ordenar <- Nombre[order(Nombre[,columna], Nombre[,2], na.last=NA),]
    
    Hospital<-if(num == "mejor") {
      Ordenar[1,2]
    } else if(num == "peor") {
      Ordenar[nrow(Ordenar), 2]
    } else{
      Ordenar[num,2]
    }
    Result <- append(Result, c(Hospital, estados[i]))
  }
  # Regresa un data frame con el nombre del hospital y la abreviatura
  # del nombre del estado al que pertenece. 
  ResultFinal <- as.data.frame(matrix(Result, length(estados), 2, byrow = TRUE))
  colnames(ResultFinal) <- c("Hospital", "Estado")
  rownames(ResultFinal) <- estados
  
  ResultFinal
}

head(rankingcompleto("ataque", 20), 10)
tail(rankingcompleto("neumonía", "peor"), 3)
tail(rankingcompleto("falla"), 10) 
  
