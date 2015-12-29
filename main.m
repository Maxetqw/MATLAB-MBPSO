load oilsk81.mat
load oilsk85.mat
Train_data = MM_S( oilsk81data );
Train_lable = oilsk81lable ;
Test_data = MM_S( oilsk85data );
Test_lable = oilsk85lable;
k = 5;
charac_BPSO = BPSO( Train_data , Train_lable , Test_data , Test_lable , k );
charac_MBPSO = MBPSO( Train_data , Train_lable , Test_data , Test_lable , k );
rate1 = KNN( Train_data , Train_lable , Test_data , Test_lable , k , charac_BPSO)
rate2 = KNN( Train_data , Train_lable , Test_data , Test_lable , k , charac_MBPSO)
