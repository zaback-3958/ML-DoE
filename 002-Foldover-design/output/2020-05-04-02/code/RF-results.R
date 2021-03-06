
RF.results <- function(
    DF.input            = NULL,
    Design              = NULL,
    randomIndex         = NULL,
    retained.predictors = NULL,
    resolution          = NULL
    ) {

    this.function.name <- "RF.results";
    cat(paste0("\n",paste(rep("#",50),collapse=""),"\n"));
    cat(paste0("starting: ",this.function.name,"()\n"));

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    require(randomForest);
    require(FrF2);
    require(caret);
    require(e1071);
    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    n.rows <- nrow(DF.input);
    print(n.rows)
    n.cols <- ncol(DF.input);
    print(n.cols)
    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    cat(paste0("\n### Fractional Design: ",resolution,"\n"));
    # DF.input[,"my_res"] <- as.factor(DF.input[,"my_res"]);
    # labels              <- unique(DF.input[,"my_res"]);

    DF.input[,ncol(DF.input)] <- as.factor(DF.input[,ncol(DF.input)])
    labels <- unique(DF.input[,ncol(DF.input)])


    #print(table(DF.input[,ncol(DF.input)]))

    cat("\n print(levels(my_res) )\n");
    print( levels(DF.input[,"my_res"])  );

    
    #DoE.RF.results  <- data.frame()
    #results5 <- c()
    
    DoE.RF.results  <- c();

    for (i in 1:nrow(Design)){
        if (Design$ntree[i] == -1)     {ntree <- 100} else {ntree <- 500}
        if (Design$mtry[i] == -1)      {mtry <- floor(log(n.cols-1))} else {mtry <- ceiling(sqrt(n.cols-1))}
        if (Design$replace[i] == -1)   {replace <- FALSE} else {replace <- TRUE}
        if (Design$nodesize[i] == -1)  {nodesize <- 1} else {nodesize <- floor(0.1*n.rows)}
        if (Design$classwt[i] == -1)   {classwt <- c(1,10)} else {classwt <- c(10,1)}
        if (Design$cutoff[i] == -1)    {cutoff <- c(0.2, 1 -0.2)} else {cutoff <- c(0.8,1-0.8)}
        if (Design$maxnodes[i] == -1)  {maxnodes <- 5} else {maxnodes <- NULL}

  
    innerResults <- c()

    TP   <-  0
    FN   <-  0
    FP   <-  0
    TN   <-  0
    test.RF.results <- c()
    #results6 <- c()
    for (j in 1:10){
        print(paste("fold",j,"of run", i))
        # train <- DF.input[-which(randomIndex == j),]
        # test <-  DF.input[ which(randomIndex == j),]

        # cat("\n print(train.levels(my_res) )\n");
        # print( levels(train[,"my_res"])  );

        # print(table(train[,ncol(train)]))
        # print(table(test[,ncol(test)]))


        crossvalidate.res <- cross.validation(
            DF.input = DF.input,
            k        = j)

        train      = crossvalidate.res[["DF.train"]];
        validation = crossvalidate.res[["DF.valid"]];
        test       = crossvalidate.res[["DF.test"]];


    RFmodel <- randomForest::randomForest(x = train[,retained.predictors], y = train[,"my_res"],
                            xtest = test[,retained.predictors], ytest = test[,"my_res"],
                            ntree = ntree,
                            mtry = mtry,
                            replace = replace,
                            nodesize = nodesize,
                            classwt = classwt,
                            cutoff = cutoff,
                            maxnodes = maxnodes)


    # RF.machine   <-  randomForest::randomForest(
    #     x        = train[,retained.predictors],
    #     y        = train[,"my_res"],
    #     ntree    = ntree,
    #     mtry     = mtry,
    #     replace  = replace,
    #     nodesize = nodesize,
    #     classwt  = classwt,
    #     cutoff   = cutoff,
    #     maxnodes = maxnodes);

    # # predictions.train <- predict(
    # #     object  = RF.machine,
    # #     newdata = train[,retained.predictors]);

    # # predictions.validation <- predict(
    # #     object  = RF.machine,
    # #     newdata = validation[,retained.predictors]);

    # predictions.test <- predict(
    #     object  = RF.machine,
    #     newdata = test[,retained.predictors]);

    # #confusion.train = as.table(confusionMatrix(predictions.train,train[,"my_res"]));
    # #confusion.valid = as.table(confusionMatrix(predictions.validation, validation[,"my_res"]));
    # confusion.test  = as.table(confusionMatrix(predictions.test, test[,"my_res"]));



    confusion.test <- as.data.frame(RFmodel$test$confusion)

    TP   <-  TP + confusion.test[labels[2], labels[2]]
    FN   <-  FN + confusion.test[labels[2], labels[1]]
    FP   <-  FP + confusion.test[labels[1], labels[2]]
    TN   <-  TN + confusion.test[labels[1], labels[1]]

    # TPR <- TP/(TP+FN)
    # TNR <- TN/(TN+FP)
    # BACC <- (TPR + TNR)/2
    # print(BACC)
    # test.RF.results <- rbind(test.RF.results, BACC)

    TPR <- TP/(TP+FN)
    TNR <- TN/(TN+FP)
    BACC <- (TPR + TNR)/2
    print(BACC)
    test.RF.results <- c(test.RF.results, BACC)
    
  }
    cat("\n print(test.RF.results)\n");
    print( test.RF.results );
    # cat("\n print(results6)\n");
    # print( results6);


    # mean.bacc <- mean(results6)
    # print(mean.bacc)
    # results5 <- c(results5, mean.bacc)


     #mean.BACC      <- mean(as.data.frame(test.RF.results));
     mean.bacc      <- mean(test.RF.results);
     cat("\n print(mean.bacc)\n");
     print( mean.bacc );
     DoE.RF.results <- c(DoE.RF.results, mean.bacc)
    # DoE.RF.results <- rbind(DoE.RF.results, mean.BACC)

    # TPR <- TP/(TP+FN)
    # TNR <- TN/(TN+FP)
    # BACC <- (TPR + TNR)/2
    # print(BACC)
    # DoE.RF.results <- c(DoE.RF.results, BACC)

}

frfc.results <- add.response(Design, DoE.RF.results)
#frfc.results <- add.response(Design, results5)

cat("\n print(summary(frfc.results))\n");
print( summary(frfc.results) );


write.csv(
x         = frfc.results,
file      = "RFDOE.csv",
row.names = FALSE)

#save(design.resp, file = "RFDOE.RData")

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ s###
    png(paste0("plot-","main-effects-fractional-factorial-",resolution,".png"),height = 12, width = 12, units = "in", res = 30);
    MEPlot(obj   = frfc.results,
        # abbrev   = 5,
        # cex.xax  = 1.6,
        # cex.main = 2,
        main    = "Main effects plot for fractional factorial design");

     dev.off();

     png(paste0("plot-","interactions-fractional-factorial-",resolution,".png"),height = 12, width = 12, units = "in", res = 30);
     IAPlot(obj = frfc.results,
         #abbrev = 5,
         show.alias = TRUE,
         # lwd = 2,
         # cex = 2,
         # cex.xax = 1.2,
         # cex.lab = 1.5,
         main = "InteractionsPplot for Fractional Factorial Design");

     dev.off();

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
    cat(paste0("\nexiting: ",this.function.name,"()"));
    cat(paste0("\n",paste(rep("#",50),collapse=""),"\n"));
    return( frfc.results );

    }
