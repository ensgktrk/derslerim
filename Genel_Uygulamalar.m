

A=dicomread('C:\Users\LENOVO\Desktop\CT-MONO2-16-ankle');%foto�raf� bulundu�u dosyadan �a��rd�k.
imshow(A)

figure(),imhist(A)%histogram grafi�ini g�r�nt�ledik

Aa=imadjust(A);%histogram dengeleme i�lemi yap�yoruz
figure(),imshow(Aa);%histogram e�itlendikten sonra ne olaca��n� g�relim
figure(),imhist(Aa)%peki yeni histogram grafi�i nas�l oldu bir bakal�m

Ae=histeq(A);%Histogram de�erini birde e�itleyerek de�i�iklikleri g�relim
figure(),imshow(Ae)
figure(),imhist(Ae)%hangi de�erlere e�itlenme yap�ld���na bir bakal�m

A = Aa; %g�rd�k ki histogram� dengelemek e�itlemekten �ok daha iyi sonu� verdi. 
     %�yleyse en d�zg�n foto�raf� as�l foto�raf kabul edelim.   
figure(),imshow(A)

C1=imcontour(A,1,'-'); %de�i�ik de�erlerde konturlama yapal�m.
C2=imcontour(A,5,'-');
C3=imcontour(A,50,'-');
C4=imcontour(A,100,'-');
figure(), imshow(C1), figure(), imshow(C2), figure(), imshow(C3), figure(), imshow(C4)

h=fspecial('average',[3,3]);%Average filtreleme uygulayal�m.
F=imfilter(A,h);
figure(),imshow(F)

n=imnoise(A,'salt & pepper',0.1); %tuz biber denilen g�r�lt� tipini foto�raf�m�za uygulayal�m.
                                %arzuedilirse 'salt & pepper ' k�sm�na
                                %uygulanmak istenen g�r�lt� tipi
                                %se�ilebilir.
imshow(n)

fun=@(x) median(x(:)); %median filtre uygulamak i�in �nce x ad�nda bir maske olu�tural�m
K=nlfilter(n,[3,3],fun);%3x3 boyutunda bir filtre uygulamak istiyoruz.
imshow(K)
K1=nlfilter(n,[4,4],fun);%birde filtre boyutunu 4x4 yapararak de�i�iklileri g�zlemleyelim.
figure(), imshow(K1)

E=edge(A,'canny',0.048);%K��eleri daha beligin hale getirmek istersek.
figure(),imshow(E)
E1=edge(A,'prewitt',0.048);%
figure(), imshow(E1)

dicominfo(A);%en �stte hat�rlayaca��m�z gibi A isimli foto�raf�m�z dicom format�ndayd�. Detayl� olarak
             %�zelliklerini g�rmek istedi�imizde uygular�z.

             
Ib1=im2bw(A,0.1);% Segmentasyon yapabilmek amac�yla as�l foto�raf�m�z� 0 ve 1(binary) haline d�n��t�r�yoruz.
Ib2=im2bw(A,0.3);%D�n���m� yaparken farkl� farkl� e�ik de�erleri kullanarak de�i�imi g�relim.
Ib3=im2bw(A,0.5);
Ib4=im2bw(A,0.7);
Ib5=im2bw(A,0.9);
Ib6=im2bw(A,1);
Im1=immultiply(Ib1,A);%�stte resimleri farkl� e�ik de�erlerinde yaln�zca 0 ve 1 lerden olu�ur hale getirdik.
Im2=immultiply(Ib2,A);%burada da as�l foto�rafla matrisin h�crelerini tek tek �arparak segmente edilmi� 
Im3=immultiply(Ib3,A);%foto�raflar� elde ediyoruz.
Im4=immultiply(Ib4,A);
Im5=immultiply(Ib5,A);
Im6=immultiply(Ib6,A);
imshow(Im1), figure(), imshow(Im2), figure(), imshow(Im3), figure(), imshow(Im4), figure(), imshow(Im5), figure(),imshow(Im6)


graythresh(A)%kafam�za g�re e�ik de�eri uygulad�k ama as�l threshold de�eri ne ��renelim.
I=im2bw(A,0.335);%Ayn� i�lemleri as�l threshold de�erini kullanarak da yaparsak.
Im=immultiply(I,A);
figure(),imshow(Im)
Im=immultiply(A,I); % Matrisleri �arparken element element �arpt���m�z� yerlerini de�i�tirdi�imizde de�i�iklik olmamas� ile de ispatlad�k.
figure(),imshow(Im)
