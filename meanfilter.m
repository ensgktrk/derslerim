clear;
foto=rgb2gray(imread('C:\Users/LENOVO/Desktop/roc.jpg'));
%image=[1 2 3 4 5;6 7 8 9 10;11 12 13 14 15;16 17 18 19 20;21 22 23 24 25];
image=imnoise(foto,'salt & pepper',0.002);
matboy=size(image);
satyer=1;%parcanýn alýndýý satýr kodu
sutyer=1;%parcanýn alýndýðý sutun kodu
satuz=matboy(1);
sutuz=matboy(2);
parsay=int32((satuz-2)*(sutuz-2));
yenifoto=zeros(satuz-2,(sutuz-2));
for j=1:(satuz-2)
    
    for k=1:(sutuz-2)
        toplam=0;
        toplam=int32(toplam);
             
            satyer=j;
            sutyer=k;
            parca=image(satyer:satyer+2,sutyer:sutyer+2);%3x3 boyuntunda bir matris aldým.
            duzparca=parca(:)'; %3x3 boyutlu matrisin parçalarýný liste halinde yazdým
            duzparca=int32(duzparca);
            for i=1:9
                 toplam=toplam+duzparca(i);
            end
            yenifoto(satyer,sutyer)=int32(toplam/9);
    end
end
imshow(foto)      
figure();
imshow(image)
figure();
imshow(yenifoto)
