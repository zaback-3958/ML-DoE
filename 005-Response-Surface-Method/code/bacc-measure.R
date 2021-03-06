
bacc.measure.func <- function(
	DF.train           = NULL,
	DF.validation      = NULL,
	#DF.test            = NULL,
	DF.pred.train      = NULL,
	DF.pred.validation = NULL,
	#DF.pred.test       = NULL,
	classes            = NULL
	) {

	this.function.name <- "bacc.measure.func";
	cat(paste0("\n",paste(rep("#",50),collapse=""),"\n"));
	cat(paste0("starting: ",this.function.name,"()\n"));

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    require(dplyr);
    require(FrF2);
    require(caret);
    require(e1071);

	##################################################



	confusion.train = table(DF.train[,"income_year"],DF.pred.train);
	confusion.valid = table(DF.validation[,"income_year"],DF.pred.validation);
	#confusion.test  = table(DF.test[,"income_year"],DF.pred.test);



	confmtrx.train = confusion.mtrx(DF.input = confusion.train,classes = classes)
  	confmtrx.valid = confusion.mtrx(DF.input = confusion.valid,classes = classes)
  	#confmtrx.test  = confusion.mtrx(DF.input = confusion.test,classes = classes)

  
  	bacc.train = bacc.fnc(DF.input = confmtrx.train)
  	bacc.valid = bacc.fnc(DF.input = confmtrx.valid)
  	#bacc.test  = bacc.fnc(DF.input = confmtrx.test)
  
  	
    cat("\n print(bacc.valid)\n");
    print( bacc.valid );


	### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
	cat(paste0("\nexiting: ",this.function.name,"()"));
    cat(paste0("\n",paste(rep("#",50),collapse=""),"\n"));

    return( list(
	    DF.bacc.train = bacc.train,
	    DF.bacc.valid = bacc.valid))
	    #DF.bacc.test  = bacc.test));
}

####################################################
	confusion.mtrx <- function(
		DF.input = NULL,
		classes  = NULL){
			TP <- 0;
			FN <- 0;
			FP <- 0;
			TN <- 0;

			TP = TP + DF.input[classes[2], classes[2]];
			FN = FN + DF.input[classes[2], classes[1]];
			FP = FP + DF.input[classes[1], classes[2]];
			TN = TN + DF.input[classes[1], classes[1]]

  	return(list(
	  	n.tp = TP,
	  	n.fn = FN,
	  	n.fp = FP,
	  	n.tn = TN));

}

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
	bacc.fnc <- function(
		DF.input = NULL){
			TP.Rate  = DF.input[["n.tp"]]/(DF.input[["n.tp"]] + DF.input[["n.fn"]])
			TN.Rate  = DF.input[["n.tn"]]/(DF.input[["n.tn"]] + DF.input[["n.fp"]])
			bacc.msr = (TP.Rate + TN.Rate)/2
		return(bacc.msr)
}




