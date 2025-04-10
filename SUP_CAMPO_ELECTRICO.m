clc; clear; close all;
u=linspace(0,pi/2,15);
v=linspace(0,2*pi,15);

a=4;
t=linspace(-a,a,15); %parametrizacion para el plano, con medidas del radio del semicirculo

[U,V]=meshgrid(u,v);

X=a*sin(U).*sin(V);
Y=a*sin(U).*cos(V);
Z=a*cos(U);

[X_p, Y_p] = meshgrid(t, t);               
Z_p = ones(size(X_p)) * (max(Z(:)) + 2); %plano colocado a la altura maxima del circulo +5 


xt=linspace(-5,5,6);
yt=xt;
zt=xt;
[Ox,Oy,Oz]=meshgrid(xt,yt,zt);





[rows, cols] = size(X);



q1=10;
q2=-10;

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

for i = 1:rows
    for j = 1:cols
        x = X_p(i, j);
        y = Y_p(i, j);
        z = Z_p(i, j);
        [Exf,Eyf,Ezf]=coulomb(q2,Ox,Oy,Oz,x,y,z);

        Ex_total=Ex_total+Exf
        Ey_total=Ey_total+Eyf;
        Ez_total=Ez_total+Ezf;
    end
end

[Xn,Yn,Zn]=norm_coulomb(Ex_total,Ey_total,Ez_total);



%limite de abajo circulo
mask = Oz >= min(Z(:)); 

Xn_filtered = Xn .* mask;
Yn_filtered = Yn .* mask;
Zn_filtered = Zn .* mask;

figure;
hold on;
quiver3(Ox,Oy,Oz,Xn_filtered,Yn_filtered,Zn_filtered,"off");
surf(X,Y,Z) %surf of the semicircle
surf(X_p,Y_p,Z_p)
view(3)
daspect([1 1 1])
