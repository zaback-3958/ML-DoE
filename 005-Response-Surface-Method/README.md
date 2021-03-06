# Response Surface Methods
Response Surface methodology (**RSM**) as (Montgomery, D.C. (2017). Design and Analysis of Experiments (9th). Hoboken, NJ.:Wiley)
defines is a series of statistical and mathematical technique that are useful to optimize a response variable that is influenced by some variables. For instance an experimenter would be interested in finding the levels of variables <img src="http://latex.codecogs.com/gif.latex?&space;x_{1}" border="0"/>   and  <img src="http://latex.codecogs.com/gif.latex?&space;x_{2}" border="0"/> that maximize or minimize the response <img src="http://latex.codecogs.com/gif.latex?&space;y" border="0"/>. The response is a function of levels of these two variables as below:

<img src="http://latex.codecogs.com/gif.latex?&space;y=&space;f(x_{1},x_{2})&space;+\epsilon" border="0"/>

Where <img src="http://latex.codecogs.com/gif.latex?&space;\epsilon" border="0"/> represents the error of the model. The expected value of the response is :

<img src="http://latex.codecogs.com/gif.latex?&space;E(y)=&space;f(x_{1},x_{2})=&space;\eta" border="0"/>

As a result the surface is represented by:

<img src="http://latex.codecogs.com/gif.latex?&space;\eta=&space;f(x_{1},x_{2})" border="0"/>

And it is called **response surface**. 

Since in most RSM methods the relationship between responce and the independent variables is not known, a proper approximation of the relationship between them must be found. In general, at first a low order poly-nomial model is applied in some regions of the independent variables and if the statistical analysis shows that it this model is not appropriate a higher order model will be applied. The first-order model can be written as below:

<img src="http://latex.codecogs.com/gif.latex?&space;y=&space;\beta_{0}+\beta_{1}x_{1}+\beta_{2}x_{2}+\cdots+\beta_{k}x_{k}+\epsilon" border="0"/>
if a highr order model is identified the second-order model will be applied as below:

<img src="http://latex.codecogs.com/gif.latex?&space;y=&space;\beta_{0}+\sum_{i=1}^{k}\beta_{i}x_{i}+\sum_{i=1}^{k}\beta_{ii}x_{i}^{2}+\sum_{i<j}\sum\beta_{ij}x_{i}x_{j}+\epsilon" border="0"/>

This poly-nomial model does not represent the functional relationship between response and the variables over the entire space, but it could be a proper approximation for a very small region of the function. The experimental designs are performed to collect the data and the RSM parameters can be estimated. These designs are called RSM designs. There are different methods to find the optimum for response depending on the type of model. For the first-order model, method of steepest ascend/descend is performed to maximize/minimize the function. For the second order model the ridge analysis is performed.

## First-Order Model (Steepest Ascend/Descend Method)

Most of the time the initial values for the variables to optimize the response is far from optimum. In this situation the experimenter desires to move very rapidly to the closest neighborhood of the optimum. At the begining, it is assumed that the first order model can provide a good approximation in a small region of the independent variables. The method of steepest ascend/descend is a sequential procedure which provides a path in the direction of the maximum increase/decsease in the response step by step. The steepest ascend/descend direction is parallel to the normal to the fitted response and its steps are proportional to the model parameters <img src="http://latex.codecogs.com/gif.latex?&space;\beta_{i}" border="0"/>. The experimenter decides on the steps according to the experience or other consideration. The optimization of the model continues untill no further increase/decsrease in the response is observed. Then, a new first-order model might be applied with new steepest ascend/descend method. At the end, by repeating this process, it can be get closer to the optimum. At this point lack of fit test shows if the first-order model is adequate or a second-order model should be applied.

## Second-Order Model (Ridge Analysis) 
When the first-order model is not adequate and the experimenter is in the vicinity of the optimum, most of the time a second order model would be appropriate to find the set of values for independent variables that optimizes the response. In fact, the experimenter is looking for levels of the independent variables in which the partail derivatives of the second-order function is zero. That point is called a stationary point which could represent a Maximum, Minimum, or saddle point. The second-order model can be written in matrix notation as below:

<img src="http://latex.codecogs.com/gif.latex?&space;\hat{y}=&space;\hat{\beta}_{0}+\acute{\bold{x}}b+\acute{\bold{x}}B\bold{x}" border="0"/>

where:

<img src="http://latex.codecogs.com/gif.latex?\begin{bmatrix}x_{1}\\x_{2}\\&space;\vdots\\x_{k}\end{bmatrix}&space;&space;&space;&space;&space;\;\;\;\begin{bmatrix}\beta_{1}\\\beta_{2}\\&space;\vdots\\&space;\beta_{k\end{bmatrix}\;\;\;\;\begin{bmatrix}\hat{\beta_{11}} & \hat{\beta_{12}}/2 &\cdots & \hat{\beta_{1k}}/2 & \\ & \hat{\beta_{22}}/2 &\cdots &\hat{\beta_{2k}}/2 & \\ & &\ddots\\sym.&  &  & \hat{\beta_{kk}}\end{bmatrix}" border="0"/>

In these matrices **b** is a <img src="http://latex.codecogs.com/gif.latex?&space;(K\times&space;1)" border="0"/> vecotr of the coefficients, **B** is a symmetric matrix with the pure quadratic coefficents as diagonal elements and the interactions coefficients as off-diagonal elements. The derivative of the <img src="http://latex.codecogs.com/gif.latex?&space;\hat{y}" border="0"/> with respect to the **x** equated to zero:

<img src="http://latex.codecogs.com/gif.latex?&space;\frac{\partial&space;\hat{y}}{\partial&space;\bold{x}}=&space;\bold{b}+2\bold{B}\bold{x}=&space;0" border="0"/>

The stationary point can be obtained by solving the equation above:

<img src="http://latex.codecogs.com/gif.latex?&space;\bold{x}_{s}=&space;-\frac{1}{2}\bold{B}^{-1}\bold{b}" border="0"/>

The predicted responce at stationary point can also be obtained by replacing the <img src="http://latex.codecogs.com/gif.latex?&space;\bold{x}_{s}" border="0"/> in the first equation:

<img src="http://latex.codecogs.com/gif.latex?&space;\hat{y}_{s}=&space;\hat{\beta}_{0}+\frac{1}{2}{\bold{x}}'_{s}\bold{b}" border="0"/>

When the stationary point is obtained, it is required to find if it is a Maximum, Minimum, or saddle point. Also, it is important to know how sensitive the response is to the levels of the variables. The Canonical Analysis helps to find the required information. The canonical form of the model is:

<img src="http://latex.codecogs.com/gif.latex?&space;\hat{y}=&space;\hat{y}_{s}+\lambda_{1}w_{1}^{2}+\lambda_{2}w_{2}^{2}+\cdots&space;\lambda_{k}w_{k}^{2}" border="0"/>

where <img src="http://latex.codecogs.com/gif.latex?&space;w_{i}" border="0"/> are the transformed independent variables and <img src="http://latex.codecogs.com/gif.latex?&space;\lambda_{i}" border="0"/> are eigenvalues of matrix **B**. This model was obtained by transforming the second-order model into new coordinate system where the origin is the stationary point. Then, the axes of this system are rotated until they become parallel to the axes of the fitted response surface. If the eigenvalues <img src="http://latex.codecogs.com/gif.latex?&space;\lambda_{i}" border="0"/> are all negative, then the stationary point is Maximum, if they are all positive, then the stationary point is Minimum, if they have different signs, then, it is a saddle point. In the canonical form when the stationary point is within the experimentation region and and one or more <img src="http://latex.codecogs.com/gif.latex?&space;\lambda_{i}" border="0"/> are zero or very close to zero, this type of surface methid is called stationary ridge system. If the stationary point is outside the experimentation region and the same condition holds for <img src="http://latex.codecogs.com/gif.latex?&space;\lambda_{i}" border="0"/>, then if eigenvalues are negative it is called a rising ridge and id they are positive, it is called falling ridge.
## Response Surface Designs
The proper experimental designs that are used to collect the data helps to estimate the RSM parameters more effectively. These designs that are used to fit the RSM models are called Response Surface Designs. There are two types of designs which include Central Composit Design and Box-Behnken Design. 
### Central Composit Design (CCD)
This design is the most popular design for fitting second-order models. The CCD design consists of factorial points, axial or star points and center points. for in stance for a <img src="http://latex.codecogs.com/gif.latex?&space;2^{k}" border="0"/> factorial design with <img src="http://latex.codecogs.com/gif.latex?&space;k" border="0"/> factors there are <img src="http://latex.codecogs.com/gif.latex?&space;2^{k}" border="0"/> factorial points, <img src="http://latex.codecogs.com/gif.latex?&space;2k" border="0"/> axial points and <img src="http://latex.codecogs.com/gif.latex?&space;n_{c}" border="0"/> center points that could be determined. The axial points are placed at <img src="http://latex.codecogs.com/gif.latex?&space;\alpha" border="0"/> distance from the design center. The image below shows the visualization of this design for <img src="http://latex.codecogs.com/gif.latex?&space;k=&space;3" border="0"/>:

![Test Image 1](https://github.com/zaback-3958/ML-DoE/blob/master/005-Response-Surface-Method/Central-Composite-Designs.png)

This graph represents the CCD design for two-level factorial design with three factors. The red points represnt the factorial points on the corners of the cube. The green points represent the axial points or star points. The blue point represent the center point. It is important for a model to have a stable variance of the predicted response at the points of interests of <img src="http://latex.codecogs.com/gif.latex?&space;\bold{x}" border="0"/>. Therefore, it was suggested by BOX and Hunter (1957) that the design should be rotatable. The rotatability means the varaince of the response is the same at all the points that are at the same distance from the design ceneter. The CCD can be rotatble by the choice of values for <img src="http://latex.codecogs.com/gif.latex?&space;\alpha" border="0"/> which depends on the number of factorial points. 


### Box-Behnken Design (BBD)
Box and Behnken (1960) proposed these types of designs which are three-level designs for fitting response surfaces. These designs are created by combining the <img src="http://latex.codecogs.com/gif.latex?&space;2^{k}" border="0"/> designs with incomplete block designs. These type of designs are rotatble or nearly rotatble and in terms of number of runs are very efficient. This design does not contain the upper and lower levels of the variables. The image below shows the visualization of this design for <img src="http://latex.codecogs.com/gif.latex?&space;k=&space;3" border="0"/>:

![Test Image 1](https://github.com/zaback-3958/ML-DoE/blob/master/005-Response-Surface-Method/Box-Behnken-designs.png)

 This graph represents the Box-Behnken Design for two-level factorial design with three factors. As it can be seen in the graph the red points represents the factorial points and they are at the midpoints od the edges. The blue points also represents the center point for this design. By comparing the number of points between CCD and BBD on the graphs, it can be seen that BBD requires less number of runs.

# Requirements
* R v3.6.2
* packages: FrF2, RandomForest
# How to execute the pipeline
Clone this repository by running the following at the command line:

git clone ``https://github.com/zaback-3958/ML-DoE.git`` 

Change directory to the folder of this pipeline in the local cloned repository:

``cd <LOCAL CLONED REPOSITORY>/ML-DoE/002-fractional-factorial-design``

If you are using a Windows computer, execute the following batch script at the Command Prompt instead:

``.\run-main.bat``

If you are using a Linux or macOS computer, execute the following shell script in order to run the full pipeline((NOT tested)):

``.\run-main.sh``

This will trigger the creation of the output folder <LOCAL CLONED REPOSITORY>/ML-DoE/output/ if it does not already exist, followed by execution of the pipeline. All output and log files will be saved to the output folder. See below for information about the contents of the output folder.
  
  hi
  
# Input file

The required input data files in cluded adult dataset and Boston housing dataset are located in ``<LOCAL CLONED REPOSITORY>/data/``.

* adult.csv
* housing.csv

These datasets were obtained from UCI ML repository:

``https://archive.ics.uci.edu/ml/datasets/adult``

``https://archive.ics.uci.edu/ml/machine-learning-databases/housing/``

The adult dataset is used for classification to predict whether income exceeds $50K a year according to the census data. The housing dataset is used for regression to predict the median housing price. 


# Main output files
 


