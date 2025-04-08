%%
clc; clear; close all;
u=linspace(0,2*pi,15);
v=linspace(0,2*pi,15);

a=4;

[U,V]=meshgrid(u,v);

X=a*sin(U).*cos(V);
Y=a*sin(U).*sin(V);
Z=a*cos(U);

xt=linspace(-5,5,6);
yt=linspace(-5,5,6);
zt=linspace(-5,5,6);

[Ox,Oy,Oz]=meshgrid(xt,yt,zt);




[rows, cols] = size(X);

q1=-10;

Ex_total=0;
Ey_total=0;
Ez_total=0;

% Iterar por todos los puntos de la malla
for i = 1:rows
    for j = 1:cols
        x = X(i, j);
        y = Y(i, j);
        z = Z(i, j);
        [Exf,Eyf,Ezf]=coulomb(q1,Ox,Oy,Oz,x,y,z);

        Ex_total=Ex_total+Exf;
        Ey_total=Ey_total+Eyf;
        Ez_total=Ez_total+Ezf;
    end
end

[Xn,Yn,Zn]=norm_coulomb(Ex_total,Ey_total,Ez_total);


hold on;
q1=quiver3(Ox,Oy,Oz,Xn,Yn,Zn,"off");
surf(X,Y,Z)
daspect([1,1,1])