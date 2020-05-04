#!/bin/bash
FILE1="data/make_dataset"
FILE2="features/build_features"
FILE3="data/time_series_split"
FILE4="models/light_gbm/train_lightGBM_regressor"
FILE5="models/light_gbm/test_lightGBM_regressor"

SUBMIT="submit_001.py"

echo "INIT"
## declare an array variable
declare -a scripts=($FILE1 $FILE2 $FILE3 $FILE4 $FILE5)


## now loop through the above array
for i in "${scripts[@]}"
do
	echo "Converting $i to py"
	jupyter nbconvert $i.ipynb --to python
done

echo "Concatenating files in main script submit.py"
FINAL_SCRIPT=""
for i in "${scripts[@]}"
do
	FINAL_SCRIPT+=" $i.py"
done

cat $FINAL_SCRIPT > $SUBMIT

echo "REMOVING SCRIPTS GENERATED"
rm $FINAL_SCRIPT
echo "DONE"
