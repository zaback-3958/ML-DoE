# Design-of-Experiments-for-Hypereparameter-tuning
The goal of this project is to use Design of Expeiments (DoE) to do the hyperparameter tuning for some machine learning models based on an article by Gustavo et al. in:

https://asu.pure.elsevier.com/en/publications/design-of-experiments-and-response-surface-methodology-to-tune-ma

The authors used DoE to do the hyperparameter tunning for Random Forest. They used Fractional Factorial Design and full Factorial Design to find the hyper-parameters that have a significant effect on the performance of the model. Then they used Response Surface Method (RSM) to find the values for those hyper-parameters (the ones that were recognised in the previous steps) to optimize the performance of the model. They used BACC measure (Balanced accuracy which as they mentioned in the article can be used to measure the accuracy of an imbalanced dataset).

This work has been done according to the article to reproduce the results for Random Forest and then try to apply to some other machine learning models.

# General description of the Design of Experiments and some of its method
An experiment is a series of tests to identify the factors that have the greatest effect on the response. By Design of Experiment the number of factors, their ranges of values and number of times to run the experiments are determined to identify the relationship between the factors and the response variable. Sometimes the effect of several factors on a response variable is identified by testing at different levels of those factors one at a time which is useful only when there is no interaction among them. However, since sometimes factors have interactions with each other, it would be more efficient to do the experiments by including all the factors in the design. The method of Factorial Design in DoE is one of the methods that is very useful to evaluate the effect of several factors on the response variable. The general form of factorial design can be represented as:

![eq1](https://latex.codecogs.com/gif.latex?y_%7Bijk%7D%20%3D%5Cmu%20&plus;%20%5Ctau_%7Bi%7D%20&plus;%5Cbeta_%7Bj%7D%20&plus;%20%28%5CTau%5Cbeta%29_%7Bij%7D%20&plus;%20%5Cepsilon_%7Bijk%7D)

for ![eq2](https://latex.codecogs.com/gif.latex?i%20%3D%201%2C2%2C%5Cldots%2Ca), ![eq3](https://latex.codecogs.com/gif.latex?j%20%3D%201%2C2%2C%5Cldots%2Cb) and ![eq4](https://latex.codecogs.com/gif.latex?k%20%3D%201%2C2%2C%5Cldots%2Cn), where ![eq5](https://latex.codecogs.com/gif.latex?%5Cmu) is the overal mean effec, and ![eq6](https://latex.codecogs.com/gif.latex?%5Ctau_%7Bi%7D) is the effect of ``i-th``  level of factor ``A``, ![eq7](https://latex.codecogs.com/gif.latex?%5Cbeta_%7Bj%7D) is the effect of ``j-th``  level of factor ``B``, ![eq8](https://latex.codecogs.com/gif.latex?%28%5Ctau%5Cbeta%29_%7Bij%7D) is the interaction effect of factors ``A`` and ``B`` and ![eq9](https://latex.codecogs.com/gif.latex?%5Cepsilon_%7Bijk%7D) is the random error. 
## Two-level Factorial Designs
This method is represented by ![eq10](https://latex.codecogs.com/gif.latex?2%5EK) for ``K``  factors with two different levels as low and high for each level. The simplest case of this type of method is the experiments with only two factors which will result is ![eq11](https://latex.codecogs.com/gif.latex?2%5E2%3D4) runs of experiment. This method of DoE will enable the experimenter to identify which main effects have the significant effect on the response. It also shows if there is any interaction among them and if it has effect on the response. The number of runs in this type of experiment increases when number of factor increases which will result in a more time consuming design. According to some experiments the effect of the higher order interactions of three and more factors tend to be small and can often be ignored. In this case to make the experiment more efficient another method of DoE, Fractional Factorial Design is recommended.
## Two-level Fractional Factorial Designs
Fractional Factorial Design for ``K`` factors and for ``1/p`` fraction ![eq12](https://latex.codecogs.com/gif.latex?2%5E%7BK-P%7D), can be used to reduce the number of runs. for instance the fractional design with ``K = 3`` and for ``p =1 `` which is denoted by ![eq13] (https://latex.codecogs.com/gif.latex?2%5E%7B%283-1%29%7D) is the half fraction of the Full Factorial design of ![eq14](https://latex.codecogs.com/gif.latex?2%5E%7B3%7D). Therefore, instead of running the 8 treatments of the full Factorial Design, half of it (i.e. 4 treatments) will be run. the half fraction can be the one where the interaction ``ABC`` is at the high level or at the low level.
As it can be seen in the image obtained from this website:

http://reliawiki.org/index.php/File:Doe7.34.png

![Test Image 1](http://reliawiki.org/images/c/c8/Doe7.34.png)


Figure (a) shows the Full Factorial design of three factors and figures (b) and (c) show the half fraction of it where interaction ``ABC`` is at its high and low level respectively. 

The interaction effect,``ABC``, is the generator or word for this type of design and since the intercept and this interaction effect are identical, it is written as ``I = ABC``. This equation is the defining relation for this design. From defining relation can conclude which efffect are aliased. It can be seen that ![eq15](https://latex.codecogs.com/gif.latex?I%5Ctimes%20B%20%3D%20B%5Ctimes%20ABC%20%5CRightarrow%20B%20%3D%20AC) and as a result ![eq16](https://latex.codecogs.com/gif.latex?C%20%3D%20AB) and ![eq17](https://latex.codecogs.com/gif.latex?A%20%3D%20BC)

It can be noted that, in the design matrix of the following figure (b), the column corresponding to the intercept, I\,\!, and column corresponding to the interaction ABC\,\!, are identical. The identical columns are written as I=ABC\,\! and this equation is called the defining relation for the design. In a DOE folio, the present {2}^{3-1}\,\! design can be obtained by specifying the design properties as shown in the following figure.



However, this method makes the effects of some of the factors to be aliased or confounded with other effects. In this situationiIt is very important to ensure that main effects and lower order interactions that are of interest to the experimenter are not aliased in this design. This is can be done by considering the resolution of the fractional factorial design. The resolution of a 
Fractional Factorial design has three characteristics which makes it very useful. The first one is that in this method very few effects are siginificant and the final model is very simple with lower order terms. The next one is the projection property which is when the model is reduced to the lower dimensinality.It also uses the fold over technique to isolate effect of some of the factors that are more important according to the experimenter's experience. 
## Response Surface Method
When all of the significant factors are recoginsed from Fractional Factorial and Full Factorial designs then the RSM will be used to find the values for those factors at which the response will be optimized. There are two types of RSM models  including first-oreder and second-order models. For the first-order model the method of Steepest Ascent Model will be used to find the values of factors that optimize the response variable. However, if the first-order model does not fit well on the design then the second-order model will be used. There are two types of designs that can be used for second-order model including Central Composite and Box-Behnken Designs. When the design is decided then the second-order model will be fit to the data to find the values for the factors that optimize the response.
# Brief description of DoE for hyper-parameter tunning
In this experiment, Fractional Factorial and full Factorial designs were used to tune the hyper-parameters of a classification Random Forest model. The hyperparameters that were chosen to be tunned were ntree, mtry, replace, cutoff, classwt, nosesize, maxnodes. For each of them two levels were considered to be used in the design. Since the effect of seven factors needs to be evaluated on the performnace of the model, we need ![eq13](https://latex.codecogs.com/gif.latex?2%5E%7B7%7D%3D128) runs with only one replication. As a result, the Fractional Factorial design will be used which as mentioned before, which is more efficient by using the fraction of the design and helps reduce the running time. Also, it is important to use the design with the resolution that keep the main effects not confounded at least with two factor effects. The Fractional Factorial design with the highest resolution helps not to have aliases for lower effects. It means that main effect are not aliased with higher effects and few two factor effects are aliased with each other and they are not aliased with higher order effects. 
For the fisrt design the Fractional design of ``2^(7-2)`` with resolution (Iv) which will create a design with 32 runs. Later since some of the two factor effects are aliased with other two effects and some of those two factor effects show significant effect on the performance of the model, the design ``2^(7-1)`` with resolution (vII) will be used to remove the aliasing of the main effects and two factor effects from other higher order effects. Later it can be seen that four factors have siginificant effect on the performance of the model. The final stage is to set the other hyperparameters at their defaults and the ones that are significant to be used in RSM to find the values for them that optimize the performance of the model.

# Requirements
* R v3.6.2
* packages: FrF2, DoE.base, RandomForest, RSM
# How to execute the pipeline
# Input file
# Main output files

