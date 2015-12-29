function [MM_S] = MM_S( data )
i=size(data,2);
j=size(data,1);
MM_S = zeros ( j , i ) ;
for a=2:i;
    maxmum=max(data(a,:));
    minmum=min(data(a,:));
    for b=1:j;
    MM_S(b,a)=(data(b,a)-minmum)/(maxmum-minmum);
    end
end
end