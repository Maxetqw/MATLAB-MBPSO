function [rate ] = KNN( Train_data , Train_lable , Test_data , Test_lable , k , charac)
Train_data_item = size ( Train_data , 1);
Test_data_item = size ( Test_data , 1);
result_count = zeros ( 5 , Test_data_item );
Distance = zeros (Test_data_item , Train_data_item );
result = zeros ( 1 , Test_data_item );
Sum = 0;
Count = 0;
for Test = 1:1:Test_data_item;
    for Train = 1:1:Train_data_item;
        for t = 1:1:6;
            x = ((Test_data(Test , t) - Train_data(Train , t)) ^ 2) * charac( 1 , t ) ;
            Sum = Sum + x;
        end
        Distance(Test,Train) = Sum;
    end
end
[~ , target]=sort(Distance , 2 ); 
for cross=1:1:Test_data_item;
    for item = 1:1:k;
      result_count ( Train_lable ( 1 , target ( cross , item )) , cross ) = result_count ( Train_lable ( 1 , target ( cross , item )) , cross ) +1 ;
    end
end
[~ , result_fin ] = sort( result_count , 2 );
for i = 1:1:Test_data_item;
    result( 1 , i ) = result_fin( 1 , i );
end
for i = 1:1:Test_data_item;
    if result ( 1 , i ) == Test_lable (1 , i );
        Count = Count +1;
    end
end
rate = Count / Test_data_item;
end
