function [Exf,Eyf,Ezf]=coulomb(q,Ox,Oy,Oz,px,py,pz)

e0=8.854187817*10^(-12);
k=1/(4*pi*e0);

syms Ex Ey Ez x y z Exp Eyp Ezp

Ex(x,y,z)=(k*q*x)/(x^2+y^2+z^2)^(3/2);
Ey(x,y,z)=(k*q*y)/(x^2+y^2+z^2)^(3/2);
Ez(x,y,z)=(k*q*z)/(x^2+y^2+z^2)^(3/2);

Exp(x,y,z)=Ex(x-px,y-py,z-pz);
Eyp(x,y,z)=Ey(x-px,y-py,z-pz);
Ezp(x,y,z)=Ez(x-px,y-py,z-pz);

Exf=double(Exp(Ox,Oy,Oz));
Eyf=double(Eyp(Ox,Oy,Oz));
Ezf=double(Ezp(Ox,Oy,Oz));

end
