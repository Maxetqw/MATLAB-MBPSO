function [charac_BPSO] = BPSO( Train_data , Train_lable , Test_data , Test_lable , k )
x = zeros (1 , 6 );
for i = 1:1:6;
    if rand() > 0.5;
        x( 1 , i ) = 1;
    else
        x( 1 , i ) = 0;
    end
end
v = zeros (1 , 6 );
for i = 1:1:6;
    v( 1 , i ) = 2*rand()-1;
end
s = zeros (1, 6);
pbest = x; 
pbest_rate = 0; 
for t = 1:1:500; 
    charac = x;
    rate = KNN( Train_data , Train_lable , Test_data , Test_lable , k , charac);
    if rate > pbest_rate ;
        pbest = charac;
        pbest_rate = rate;
    end
    for i = 1:1:6
    s( 1 , i ) = 1/(1+exp( v (1 , i )));
    if rand() < s( 1 , i );
        x( 1 , i ) = 1;
    else
        x( 1, i ) = 0;
    end
    v( 1 , i ) = s ( 1, i );
    end
end
charac_BPSO = pbest ;

