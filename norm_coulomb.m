function [Xn,Yn,Zn]=norm_coulomb(Exf,Eyf,Ezf)

Xn=(Exf)./(sqrt((Exf).^2+(Eyf).^2+(Ezf).^2));
Yn=(Eyf)./(sqrt((Exf).^2+(Eyf).^2+(Ezf).^2));
Zn=(Ezf)./(sqrt((Exf).^2+(Eyf).^2+(Ezf).^2));

end