clc;clear;close all;

% Espacio para determinar los limites del campo eléctrico

xt=linspace(-5,5,6);
yt=linspace(-5,5,6);
zt=linspace(-5,5,6);

[Ox,Oy,Oz]=meshgrid(xt,yt,zt);

%Espacio para definir las variables
p1x=0;
p1y=0;
p1z=0;
q1=10;

p2x=5;
p2y=0;
p2z=0;
q2=-10;


%Espacio para introducir las variables en la función

[Exf1,Eyf1,Ezf1]=coulomb(q1,Ox,Oy,Oz,p1x,p1y,p1z);
[Exf2,Eyf2,Ezf2]=coulomb(q2,Ox,Oy,Oz,p2x,p2y,p2z);



Exfr=Exf1+Exf2;
Eyfr=Eyf1+Eyf2;
Ezfr=Ezf1+Ezf2;


[Xn,Yn,Zn]=norm_coulomb(Exfr,Eyfr,Ezfr);

% Espacio para graficar el campo vectorial
hold on;
subplot(2,1,1);
q=quiver3(Ox,Oy,Oz,Exfr,Eyfr,Ezfr,"off");
q.Color="r";


daspect([1,1,1]);
hold off;

subplot(2,1,2);
q1=quiver3(Ox,Oy,Oz,Xn,Yn,Zn,"off");
q1.Color="r";
daspect([1,1,1]);



