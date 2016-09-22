Completos<-function(directorio, id=1:332){
  Nobs<-vector("numeric")
  for (i in id){
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
  Nobs[i]<- sum(complete.cases(Archivo))
  }
  data.frame(id,Nobs)
}
Completos("specdata",1:20)
