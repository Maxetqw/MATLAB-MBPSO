function [charac_MBPSO] = MBPSO( Train_data , Train_lable , Test_data , Test_lable , k )
x = zeros (1 , 6 );
x1 = zeros (1 , 6 );
N = 0;
Rmut = 0;
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
        x1( 1 , i ) = 1;
    else
        x1( 1, i ) = 0;
    end
    v( 1 , i ) = s ( 1, i );
    end
    for i = 1:1:6
        if x ( 1 , i ) - x1( 1 , i ) ~= 0 ;
            N=N+1;
        end
        Rmut = 1/N;
    end
    for i = 1:1:6
    if rand() <= Rmut;
        x( 1 , i ) = abs(x1(1,i)-1);
    else
        x( 1 , i ) = x1( 1 , i );
    end
    v( 1 , i ) = s ( 1, i );
    end
end
charac_MBPSO = pbest ;
