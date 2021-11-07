The answer for

 Using the dataset from https://archive.ics.uci.edu/ml/datasets/Car+Evaluation, 

 create a machine learning model to predict the buying price given the following parameters:

Maintenance = High Number of doors = 4 Lug Boot Size = Big Safety = High Class Value = Good is = 2 Medium price"

The prediction is Medium for buying. 

I have tried to run the model using buying as prediction class but it is not working due to the data skewness
Thus I find all prediction of class with 'good' and look for data closest to the require specs
I found [1. 2. 2. 2. 0. 2.] , [1. 2. 2. 2. 1. 2.] ,[1. 2. 2. 1. 0. 2.] and [1. 2. 2. 1. 1. 2.] which are all encoding 
for related columns and most prediction is buying at 1 which is Medium price 
The only variable can't be account for in the data is lug boot but as I measure the relationship 
with lug_boot with buying price and found is evenly distributed.
I thus conclude is not an important variable and the prediction of medium is safe and highly possible