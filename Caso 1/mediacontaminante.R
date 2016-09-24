Mediacontaminante<-function(directorio, contaminante, id=1:332){
 Cuenta<-0
 Suma1<-0
  #n<-vector("numeric",332)
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
    Completas<-Archivo[complete.cases(Archivo[,columna]), ]
    CuentaCol <- nrow(Completas) 
    Cuenta <- sum(CuentaCol, Cuenta)
    Suma <- sum(Completas[,columna]) 
    Suma1<- Suma1+Suma
  }
  Promedio <- Suma1/Cuenta
    print(paste("La media es",Promedio,sep=" "))         
  }
Mediacontaminante("specdata","nitrate",4:2)

