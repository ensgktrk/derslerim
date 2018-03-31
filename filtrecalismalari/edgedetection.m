clear;
clc;
image=rgb2gray(imread('C:\Users/LENOVO/Desktop/ast.jpg'));
%=[1 2 3 4 5;6 7 8 9 10;11 12 13 14 15;16 17 18 19 20;21 22 23 24 25];
matboy=size(image);
satyer=1;%parcanýn alýndýý satýr kodu
sutyer=1;%parcanýn alýndýðý sutun kodu
satuz=matboy(1);
sutuz=matboy(2);
yenifoto=zeros(satuz-2,(sutuz-2));
x_maske=1/8*([1 0 -1;2 0 -2;1 0 -1]);
y_maske=1/8*([1 2 1;0 0 0;-1 2 -2]);
for j=1:(satuz-2)
    
    for k=1:(sutuz-2)
        satyer=j;
        sutyer=k;
        parca=double(image(satyer:satyer+2,sutyer:sutyer+2));%3x3 boyuntunda bir matris aldým.
        gx=x_maske.*parca;
        gy=y_maske.*parca;
        g=sqrt((gx.*gx)+(gy.*gy));
        yenifoto(satyer:satyer+2,sutyer:sutyer+2)=g;
    end
end
imshow(image)
figure()
imshow(yenifoto)
