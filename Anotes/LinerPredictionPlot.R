library(mosaicData)
data(HELPrct)


############################
##EXAMPLE 1
############################
#Run Model of Interest
mod<-lm(cesd~max_drinks, data=HELPrct)
summary(mod)

#Create a data frame with your explanatory variable ONLY
#Include any value of the explanatory variable 
#you would like in your visualization. Here we want max drinks 0,10,20,30,40,50

new_obs<-expand.grid(max_drinks=seq(from=0,to=50, by=10))

#The code below creates a new data set (plot_data) and attaches
#the predictions from the model
plot_data<-cbind(new_obs,predict(mod, newdata=new_obs, se=TRUE))

#The code below adds two new values that help describe the
#uncertainty of the estimated values
plot_data$LB<-plot_data$fit-1.96*plot_data$se.fit
plot_data$UB<-plot_data$fit+1.96*plot_data$se.fit

#Graphing linear predictions
ggplot(data=plot_data)+
  geom_point(aes(x=max_drinks, y=fit))+
  geom_errorbar(aes(x=max_drinks, ymin=LB, ymax=UB))+
  ylab("Predict CESD score")+
  xlab("Maximum Number of Drinks")




############################
##EXAMPLE 2
############################
#Run Model of Interest
mod2<-lm(cesd~max_drinks+homeless, data=HELPrct)
summary(mod2)

#Create a data frame with your explanatory variable ONLY
#Include any value of the explanatory variable 
#you would like in your visualization. Here we want max drinks 0,10,20,30,40,50

new_obs<-expand.grid(max_drinks=seq(from=0,to=50, by=10),
                     homeless=c("homeless","housed"))

#The code below creates a new data set (plot_data) and attaches
#the predictions from the model
plot_data<-cbind(new_obs,predict(mod, newdata=new_obs, se=TRUE))

#The code below adds two new values that help describe the
#uncertainty of the estimated values
plot_data$LB<-plot_data$fit-1.96*plot_data$se.fit
plot_data$UB<-plot_data$fit+1.96*plot_data$se.fit

#Graphing linear predictions
ggplot(data=plot_data)+
  geom_errorbar(aes(x=max_drinks, ymin=LB, ymax=UB, color=homeless),
                position="dodge")+
  ylab("Predict CESD score")+
  xlab("Maximum Number of Drinks")
