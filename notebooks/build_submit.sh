#!/bin/bash
FILE1 = data/make_dataset
FILE2 = features/build_features
FILE3 = data/time_series_split
FILE4 = models/light_gbm/train_lightGBM_regressor
FILE5 = models/light_gbm/test_lightGBM_regressor


jupyter nbconvert $FILE1.ipynb --to python
jupyter nbconvert $FILE2.ipynb --to python 
jupyter nbconvert $FILE3.ipynb --to python
jupyter nbconvert $FILE4.ipynb --to python
jupyter nbconvert $FILE5.ipynb --to python
cat $FILE1 $FILE2 $FILE3 $FILE4 $FILE5 > submit_001.py