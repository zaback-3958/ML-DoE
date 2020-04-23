# Design-of-Experiments-for-Hypereparameter-tuning
The goal of this project is to use Design of Expeiments (DoE) to do the hyperparameter tuning for some machine learning models based on an article by Gustavo et al. in:

https://asu.pure.elsevier.com/en/publications/design-of-experiments-and-response-surface-methodology-to-tune-ma

The authors used DoE to do the hyperparameter tunning for Random Forest. They used Fractional Factorial Design and full Factorial Design to find the hyper-parameters that have a significant effect on the performance of the model. Then they used Response Surface Method (RSM) to find the values for those hyper-parameters (the ones that were recognised in the previous steps) to optimize the performance of the model. They used BACC (Balanced accuracy which as they mentioned in the article can be used to measure the accuracy of an imbalanced dataset.

This work has been done according to the article to reproduce the results for Random Forest and then try to apply to some other machine learning models.

# General description of the Design of Experiments and some of its method
An experiment is a series of tests to identify the factors that have the greatest effect on the response. By Design of Experiment the number of factors, their ranges of values and number of times to run the experiments are determined to identify the relationship between the factors and the response variable. Sometimes the effect of several factors on a response variable is identified by testing at different levels of those factors one at a time which is useful only when there is no interaction among them. However, since sometimes factors have interactions with each other, it would be more effective to do the experiments by including all the factors in the design. There are several methods for DoE which are very useful in different context and according to the situation. The general form of factorial design can be represented as:
```math #yourmathlabel
\begin{equation}
y_{ijk} =\mu + \tau_{i} +\beta_{j} + (\Tau\beta)_{ij} + \epsilon_{ijk}
\end{equation}
```
## Two-level Factorial Designs
This method is represented as ``2^K`` for ``K``  factors with two different levels as low and high. The simplest case of this type of method is the experiments with only two factors which will result is ``2^2=4`` runs of experiment. Tise method of DoE will enable the experimenter to identify which main effects have the significant effect on the response. It also shows if there is any interaction among them and if it has effect on the response. The number of runs in this type experiment increase when number of factor increases which needs more time as number of factor increases. According to some experiments the effect of the higher order interactions of three and more factors tend to be small and can often be ignored. In this case to make the experiment more efficient another method of DoE design, Fractional Factorial Design, can be used to reduce the running time but at the same time it makes some of the factors to be aliased or confounded. Fractional Factorial design has three characteristics which makes it very useful. The first one is that in this method very few effects are siginificant and the final model is very simple with lower order terms. The next one is the projection property which is when the model is reduced to the lower dimensinality.It also uses the fold over technique to isolate effect of some of the factors that are more interterest to the experimenter. 
```math #yourmathlabel
a + b = c
```
## Response Surface Method
When all of the significant factors are recoginsed from Fractional Factorial and Full Factorial designs then the RSM will be used to find the values for those factors at which the response will be optimized. There are two types of RSM models which includes first-oreder and second-order models. For the first-order model the method of Steepest Ascent Model will be used to find the values of factors that optimize the response. However, if the first-order model does not fit well then the second-order model will be used. There are two types of designs that can be used for second-order model which include Central Composite and Box-Behnken Designs. When the design is decided then the second-order model will be fit to find the values for the factors that optimize the response.
# Brief description of DoE for hyper-parameter tunning
In this experiment, Fractional Factorial and full Factorial designs were used to tune the hyper-parameters of a classification Random Forest model. The hyperparameters that were chosen to be tunned were ntree, mtry, replace, cutoff, classwt, nosesize, maxnodes. For each of them two levels were considered to be used in the design. Since the effect of seven factors needs to be evaluated on the performnace of the model, we need 2^7 = 128 runs with only one replication. As a result, the Fractional Factorial design will be used which as mentioned before, which is more efficient by using the fraction of the design and helps reduce the running time. Also, it is important to use the design with the resolution that keep the main effects not confounded at least with two factor effects. The Fractional Factorial design with the highest resolution helps not to have aliases for lower effects. It means that main effect are not aliased with higher effects and few two factor effects are aliased with each other and they are not aliased with higher order effects. 
For the fisrt design the Fractional design of 2^7-2 with resolution (Iv) which will create a design with 32 runs. Later since some of the two factor effects are aliased with other two effects and some of those two factor effects show significant effect on the performance of the model, the design 2^(7-1) with resolution (vII) will be used to remove the aliasing of the main effects and two factor effects from other higher order effects. Later it can be seen that four factors have siginificant effect on the performance of the model. The final stage is to set the other hyperparameters at their defaults and the ones that are significant to be used in RSM to find the values for them that optimize the performance of the model.

# Requirements
* R v3.6.2
* packages: FrF2, DoE.base, RandomForest, RSM
# How to execute the pipeline
# Input file
# Main output files

