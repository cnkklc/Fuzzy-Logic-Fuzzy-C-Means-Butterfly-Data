clear all;
close all;
clc;
%% Cenk KILIÇ / Fuzzy C-Means Butterfly Data
%Data
x=[0 0 0 1 1 1 2 3 4 5 5 5 6 6 6;0 2 4 1 2 3 2 2 2 1 2 3 0 2 4]; 
m=1.25;
c=2;
error=0.01;
j=2/m-1;
a1=0.854;
b1=0.146;
for i=1:1:15
    a(i)=a1;
    b(i)=b1;
end
a(2)=0.146;
b(2)=0.854;
u=[a;b];
e=5;
step=0;
while e > error
%% Vectors
    step=step+1;
    for i=1:1:15
        va11(i)=(u(1,i)^m)*(x(1,i));
        vb11(i)=u(1,i)^m;
        va12(i)=(u(1,i)^m)*(x(2,i));
        vb12(i)=u(1,i)^m;
                
        va21(i)=(u(2,i)^m)*(x(1,i));
        vb21(i)=u(2,i)^m;
        va22(i)=(u(2,i)^m)*(x(2,i));
        vb22(i)=u(2,i)^m;
    end
    v11=(sum(va11))/(sum(vb11));
    v12=(sum(va12))/(sum(vb12));
    v1=[v11 v12] ;
        
    v21=(sum(va21))/(sum(vb21));
    v22=(sum(va22))/(sum(vb22));
    v2=[v21 v22] ;
        
%% 

    for i=1:1:15
        d1 = sqrt(((x(1,i)-v11)^2 + (x(2,i) - v12))^2);  
        d2 = sqrt(((x(1,i)-v21)^2 + (x(2,i) - v22))^2);
        N1(i)=(1+(d1/d2)^j)^-1 ;
        N2(i)=1-N1(i) ;
    end
    Unew=[N1;N2]
    e = norm(Unew-u,1)
    u=Unew
    step
        
end

