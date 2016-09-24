corr <- function(directorio, horizonte = 0){
  CR <- vector("numeric")
  Resultado<-vector("numeric")
  for (i in 1:332){
    if (i <10){
      Ubicación<-paste(setwd("~/GitHub/Programacion_Actuarial_III_OT16"),"/",directorio,"/","00",i,".csv",sep="")
      Archivo<-read.csv(Ubicación)
    }
    else if (i<100){
      Ubicación<-paste(setwd("~/GitHub/Programacion_Actuarial_III_OT16"),"/",directorio,"/0",i,".csv",sep="")
      Archivo<-read.csv(Ubicación)
    }
    else{
      Ubicación<-paste(setwd("~/GitHub/Programacion_Actuarial_III_OT16"),"/",directorio,"/",i,".csv",sep="")
      Archivo<-read.csv(Ubicación)
    }
  Completos<-complete.cases(Archivo)
  Casos<-Archivo[Completos,]
  Contar<-nrow(Casos)
  if (Contar>=horizonte){
    CR<-cor(Casos[3],Casos[2])
    Resultado<-c(Resultado,CR)
  }
  }
  Resultado
}
corr("specdata", 20)
