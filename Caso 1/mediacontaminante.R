Mediacontaminante<-function(directorio, contaminante, id=1:332){
  cuenta<-vector("numeric")
  n<-vector("numeric")
  if (contaminante=="nitrate"){
        columna <- 3 
       } else if (contaminante=="sulfate") {
           columna <- 2
         }
     
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
       cuenta<-sum(complete.cases(Archivo[ ,columna]))
  }
       n<-c(n,Archivo[,columna])
       Promedio<-(sum(n,na.rm=T)/cuenta)
       print(paste("La media es",Promedio,sep=" "))         
     }
Mediacontaminante("specdata","nitrate","1")
