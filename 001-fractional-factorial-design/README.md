# Design-of-Experiments-for-Hypereparameter-tuning
The goal of this project is to use Design of Expeiments (DoE) to do the hyperparameter tuning for some machine learning models based on an article by Gustavo et al. in:

https://asu.pure.elsevier.com/en/publications/design-of-experiments-and-response-surface-methodology-to-tune-ma

The authors used DoE to do the hyperparameter tunning for Random Forest. They used Fractional Factorial Design and full Factorial Design to find the hyper-parameters that have a significant effect on the performance of the model. Then they used Response Surface Method (RSM) to find the values for those hyper-parameters (the ones that were recognised in the previous steps) to optimize the performance of the model. They used BACC measure (Balanced accuracy which as they mentioned in the article can be used to measure the accuracy of an imbalanced dataset).

This work has been done according to the article to reproduce the results for Random Forest and then try to apply to some other machine learning models.

# General description of the Design of Experiments and some of its method
An experiment is a series of tests to identify the factors that have the significant effect on the response. Design of Experiment is a method in which the number of factors, their ranges of values and number of times to run the experiments are determined to identify the relationship between the factors and the response variable. Sometimes the effect of several factors on a response variable can be measured by testing one factor at a time at their different levels which is useful only when there is not an interaction among those factors. However, since sometimes factors have interactions with each other, it is more efficient to do the experiments by including all the factors in the design. The method of Factorial Design from DoE is one of the methods that is very useful to evaluate the effect of several factors on the response variable at the same time. The general form of Factorial design can be represented as:

<img src="http://latex.codecogs.com/gif.latex?Y_{ijk}=\mu+\tau_{i}+\beta_{j}+(\tau\beta)_{ij}+\epsilon_{ijk}" border="0"/>


for <img src="http://latex.codecogs.com/gif.latex?i=1,2,\cdots,a" border="0"/> ,  <img src="http://latex.codecogs.com/gif.latex?j=1,2,\cdots,b" border="0"/> , and <img src="http://latex.codecogs.com/gif.latex?k=1,2,\cdots,n" border="0"/>
, where <img src="http://latex.codecogs.com/gif.latex?\mu" border="0"/>
 is the overal mean effec, and <img src="http://latex.codecogs.com/gif.latex?\tau_{i}" border="0"/>
is the effect of ``i-th``  level of factor ``A``, <img src="http://latex.codecogs.com/gif.latex?\beta_{j}" border="0"/>
 is the effect of ``j-th``  level of factor ``B``, <img src="http://latex.codecogs.com/gif.latex?(\tau\beta)_{ij}" border="0"/>
 is the interaction effect of factors ``A`` and ``B`` and <img src="http://latex.codecogs.com/gif.latex?\epsilon_{ijk}" border="0"/> is the random error. 
## Two-level Factorial Designs
This method is represented by <img src="http://latex.codecogs.com/gif.latex?2^{k}"/>
 for ``K``  factors with two different levels as low and high for each factor. The simplest case of this type of method is the experiments with only two factors which will result is <img src="http://latex.codecogs.com/gif.latex?2^{2}=4" border="0"/>
 runs of experiment. This method of DoE will enable the experimenter to identify which main effects are significant. It also shows if there is any interaction among them and if it has effect on the response. The number of runs in this type of experiment increases when number of factor increases which will result in a more time consuming design. According to some experiments the effect of the higher order interactions of three and more factors tend to be small and can often be ignored. In this case to make the experiment more efficient another method of DoE, Fractional Factorial Design is recommended.
## Two-level Fractional Factorial Designs
Fractional Factorial Design for ``K`` factors and for ``1/p`` fraction <img src="http://latex.codecogs.com/gif.latex?2^{K-p}" border="0"/>
, can be used to reduce the number of runs. for instance the fractional design with ``K = 3`` and for ``p =1 `` which is denoted by <img src="http://latex.codecogs.com/gif.latex?2^{3-1}" border="0"/>
 is the half fraction of the Full Factorial design of <img src="http://latex.codecogs.com/gif.latex?2^{3}" border="0"/>. Therefore, instead of running the 8 treatments of the Full Factorial Design, half of it (i.e. 4 treatments) will be run. the half fraction can be the one where the interaction ``ABC`` is at the high level or at the low level.
As it can be seen in the image obtained from this website:

http://reliawiki.org/index.php/File:Doe7.34.png

![Test Image 1](http://reliawiki.org/images/c/c8/Doe7.34.png)


Figure (a) shows the Full Factorial design of three factors and figures (b) and (c) show the half fraction of it where interaction ``ABC`` is at its high and low level respectively. 

The interaction effect,``ABC``, is the generator or word for this type of design and since the intercept and this interaction effect are identical, it is written as ``I = ABC``. This equation is the defining relation for this design. From defining relation can conclude which effect are aliased or confounded. It can be seen that 

<img src="http://latex.codecogs.com/svg.latex?I\times\,B=B\times&space;ABC\Rightarrow\;B=AC" border="0">


 and as a result <img src="http://latex.codecogs.com/svg.latex?C=AB" border="0"/> and <img src="http://latex.codecogs.com/svg.latex?A=BC" border="0"/> . These equations show that the main effects ``A``, ``B`` and ``C`` are aliased with ``BC``, ``AC``, and ``AB`` respectively. 

Sometimes even half fraction design is very large because of the numebr of factors, and it needs a large number of runs. in this case the fraction of the design can be increased from a half fraction to a quarter fraction as

<img src="http://latex.codecogs.com/svg.latex?2^{K-2}=\frac{1}{2}\times(2^{K-1})=\frac{1}{4}(2^{K})"/>  

which is the half fraction of the previous fractional design.In this design at first half of the design with its generator(s) is selected and then from the first half the second half with its generator(s) will be selected. 

Althogh this method decreases the number of runs, as it was mentioed before, it makes the effects of some of the factors to be confounded with other effects. In this situationi it is very important to ensure that main effects and lower order interactions that are of interest to the experimenter are not aliased with other effects or there are few aliasing in the design. This can be done by considering the resolution of the Fractional Factorial design. The resolution of a Fractional Factorial design is the lowest oreder of the effect in the defining relation. For instance for a three factor Fractional Factorial Design as mentioned above the defining relation is ``I = ABC``, so as a result this is a design with resolution three. Resolution of a design is represented by Roman numbers. For instance the half fraction design with three factors and with this defining relation is written as <img src="http://latex.codecogs.com/gif.latex?2_{III}^{3-1}" border="0"/>. The resolution of a design is very important since the higher the resolution, the less confounding the lower effets will be with other effects. The resolution ``III`` and lower are not recommended since it will make the main effects to be confounded. 

There are designs with the same resolution whuch have different confouding structures. some have more lower effects alliased comparing to the other due to defining relation that is used. In this case the design with a resolution is recommended that has fewer cofounding factors than others and this is called a minimum aberration design. 

Sometimes a design with a resolution is selected and for the experimenter some of the lower effects that are important are aliased with other effects. In this case, those effect could be dealised with the method of foldover which can be explained in an example. For instance for the three factors Fractional design that was metioned above, three main factors were alised with the effect of two-factor interactions. In fact, if the two-factor effects considered to be unimportant then the main effects ``A``, ``B`` and ``C``can be obtained from ``A+BC``, ``B+AC``, and ``C+AB``. However, if this assumption does not hold then these main effects will be deliased by using the second half fraction of the design ``I = -ABC``. For the second half fraction design the main effects will be obtained from ``A-BC``, ``B-AC``, and ``C-AB``. Finally, the deliased main effect will be obtained by combining the effects obtained from both half fractions. In this process the Fractional Factorial design is augmented by the other fraction and this design is called a foldover design. 


Fractional Factorial design has three characteristics which makes it very useful. The first one is that in this method very few effects are siginificant and the final model is very simple with lower order terms. Second, it uses the fold over technique to isolate effect of some of the factors that are more important according to the experimenter's experience. Finally it uses the projection property which helps to reduce the design to a lower dimensinality
## Response Surface Method
When all of the significant factors are recoginsed from Fractional Factorial and Full Factorial designs then the RSM will be used to find the values for those factors at which the response will be optimized. There are two types of RSM models including first-oreder and second-order models. For the first-order model the method of Steepest Ascent method will be used to find the values of factors that optimize the response variable. On the other hand, if the first-order model does not fit well on the data then the second-order model will be used. There are two types of designs that can be used for second-order model including Central Composite and Box-Behnken Designs. When the design is decided then the second-order model will be fit to the data to find the values for the factors that optimize the response.
# Brief description of DoE for hyper-parameter tunning
In this experiment, Fractional Factorial and full Factorial designs were used to tune the hyper-parameters of a classification Random Forest model. The hyperparameters that were chosen to be tunned were ``ntree, mtry, replace, cutoff, classwt, nosesize, maxnodes``. For each of these hyper-parameters two levels were considered to be used in the design. Since the effect of seven factors needs to be evaluated on the performnace of the model, we need <img src="http://latex.codecogs.com/svg.latex?2^{7}=128" border="0"/> runs with only one replication. As a result, the Fractional Factorial design will be used which as mentioned before, is more efficient by using the fraction of the design and helps reduce the running time. Also, it is important to use the design with the resolution that keep the main effects not to be confounded with two-factor effects. Since a design with higher resolution is recommended the Fractional design <img src="http://latex.codecogs.com/gif.latex?2_{IV}^{7-2}" border="0"/> which will create a design with 32 runs was run. 

# Requirements
* R v3.6.2
* packages: FrF2, DoE.base, RandomForest, RSM
# How to execute the pipeline
Clone this repository by running the following at the command line:

git clone ``https://github.com/zaback-3958/ML-DoE.git`` 

Change directory to the folder of this pipeline in the local cloned repository:

``cd <LOCAL CLONED REPOSITORY>/ML-DoE/``

If you are using a Windows computer, execute the following batch script at the Command Prompt instead:

``.\run-main.bat``

If you are using a Linux or macOS computer, execute the following shell script in order to run the full pipeline((NOT tested)):

``.\run-main.sh``

This will trigger the creation of the output folder <LOCAL CLONED REPOSITORY>/ML-DoE/output/ if it does not already exist, followed by execution of the pipeline. All output and log files will be saved to the output folder. See below for information about the contents of the output folder.
  
# Input file

The required input data files in cluded adult dataset and Boston housing dataset are located in ``<LOCAL CLONED REPOSITORY>/data/``.

* adult.csv
* housing.csv

These datasets were obtained from UCI ML repository:

``https://archive.ics.uci.edu/ml/datasets/adult``

``https://archive.ics.uci.edu/ml/machine-learning-databases/housing/``

The adult dataset is used for classification to predict whether income exceeds $50K a year according to the census data. The housing dataset is used for regression to predict the median housing price. 


# Main output files
This is the first phase of this project for which the results of Fractional Factorial Design were obtained. In this phase the effect of seven hyper-parameters of Random Forest was evaluated on the perfomrmance of the model (i.e. BACC for adult dataset as classification problem). As it was mentioned above the Fractional Factorial Design of <img src="http://latex.codecogs.com/gif.latex?2_{IV}^{7-2}" border="0"/>  was selected. In this design the main effects are not alised with two-factor interactions, However the main effects are alised with three-factor interactions and two-factor interactions are alised with each other. It is required to see the results and decide if some of the main effects or interactions need to be de-alised.  

The experiments was done by dividing the dataset into train,valiadtio, and test and also a 10-fold cross validation was performed. The main effects graph in the output folder ``<LOCAL CLONED REPOSITORY>/ML-DoE/output/`` shows that the hyper-parameters ``nodesize, maxnode, replace, classwt`` have significant effect on the response which is according to the result was obtained in ``stdout.R.runall``. Also, the interaction effects shows that the interactions ``replace:nodesize, replace:classwt, replace:maxnodes, nodesize:cutoff, nodesize:maxnodes, classwt:cutoff, cutoff:maxnodes`` have significant effects on the reponse. It can be observed that the main effect of cutoff is not significant, but some of its interactions with others is significant. Since in this design the main effects are alised with higher order effects and two-factor interactions are alised with other two-factor interactions, it is required to de-alise the factor effects to find the real main effects and interactions that have significant effect on the resoinse. In the next phase the foldover design needs to be used to extract the significant main effects and interactions.