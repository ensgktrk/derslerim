clear;
clc;
image=rgb2gray(imread('C:\Users/LENOVO/Desktop/degisik.jpg'));
%image=[1 2 3 4 5;6 7 8 9 10;11 12 13 14 15;16 17 18 19 20;21 22 23 24 25];
matboy=size(image);
satyer=1;%parcanýn alýndýý satýr kodu
sutyer=1;%parcanýn alýndýðý sutun kodu
satuz=matboy(1);
sutuz=matboy(2);
parsay=int32((satuz-2)*(sutuz-2));
yenifoto=zeros(satuz-2,(sutuz-2));
kernel=ones(3,3);
for j=1:(satuz-2)
    
    for k=1:(sutuz-2)
        toplam=0;
        toplam=double(toplam);
             
            satyer=j;
            sutyer=k;
            parca=double(image(satyer:satyer+2,sutyer:sutyer+2));%3x3 boyuntunda bir matris aldým.
            duzparca=parca(:)'; %3x3 boyutlu matrisin parçalarýný liste halinde yazdým
            duzparca=double(duzparca);
            sirpar=sort(duzparca);
            mediani=median(sirpar);
            yenifoto(satyer,sutyer)=mediani;
    end
end

