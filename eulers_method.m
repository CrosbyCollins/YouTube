%%Euler's Method for y'(t)=t+y

clear all; 
close all;
clc;

%Create Variables
f=@(t,y)t+y;
t0=0;
y0=1;
h=0.15;

tn=1;
n=(tn-t0)/h;

T(1)=t0;
Y(1)=y0;

%Set up formula
for i=2:n
    Y(i)=Y(i-1)+h*feval(f,T(i-1),Y(i-1));
    T(i)=T(i-1)+h;
end 

%Plot exact and approximate solutions
figure(1);
sol=dsolve('Dy=y+t','y(0)=1','t'); 

y_exact=inline(vectorize(sol));
title('Exact vs. Approx');
plot(T,y_exact(T),'b*-');
xlabel('t');
ylabel('y(t)');
hold on 
plot(T,Y,'ro-');
legend('Exact Solution','Approx. Solution');

%Error plot
figure(2);
for i=1:n
    err(i)=y_exact(T(i))-Y(i);
end
    
plot(T,abs(err),'b*-');
title('Error Plot');