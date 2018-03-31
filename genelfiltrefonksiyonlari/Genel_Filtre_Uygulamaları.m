

A=dicomread('C:\Users\LENOVO\Desktop\CT-MONO2-16-ankle');%fotoðrafý bulunduðu dosyadan çaðýrdýk.
imshow(A)

figure(),imhist(A)%histogram grafiðini görüntüledik

Aa=imadjust(A);%histogram dengeleme iþlemi yapýyoruz
figure(),imshow(Aa);%histogram eþitlendikten sonra ne olacaðýný görelim
figure(),imhist(Aa)%peki yeni histogram grafiði nasýl oldu bir bakalým

Ae=histeq(A);%Histogram deðerini birde eþitleyerek deðiþiklikleri görelim
figure(),imshow(Ae)
figure(),imhist(Ae)%hangi deðerlere eþitlenme yapýldýðýna bir bakalým

A = Aa; %gördük ki histogramý dengelemek eþitlemekten çok daha iyi sonuç verdi. 
     %Öyleyse en düzgün fotoðrafý asýl fotoðraf kabul edelim.   
figure(),imshow(A)

C1=imcontour(A,1,'-'); %deðiþik deðerlerde konturlama yapalým.
C2=imcontour(A,5,'-');
C3=imcontour(A,50,'-');
C4=imcontour(A,100,'-');
figure(), imshow(C1), figure(), imshow(C2), figure(), imshow(C3), figure(), imshow(C4)

h=fspecial('average',[3,3]);%Average filtreleme uygulayalým.
F=imfilter(A,h);
figure(),imshow(F)

n=imnoise(A,'salt & pepper',0.1); %tuz biber denilen gürültü tipini fotoðrafýmýza uygulayalým.
                                %arzuedilirse 'salt & pepper ' kýsmýna
                                %uygulanmak istenen gürültü tipi
                                %seçilebilir.
imshow(n)

fun=@(x) median(x(:)); %median filtre uygulamak için önce x adýnda bir maske oluþturalým
K=nlfilter(n,[3,3],fun);%3x3 boyutunda bir filtre uygulamak istiyoruz.
imshow(K)
K1=nlfilter(n,[4,4],fun);%birde filtre boyutunu 4x4 yapararak deðiþiklileri gözlemleyelim.
figure(), imshow(K1)

E=edge(A,'canny',0.048);%Köþeleri daha beligin hale getirmek istersek.
figure(),imshow(E)
E1=edge(A,'prewitt',0.048);%
figure(), imshow(E1)

dicominfo(A);%en üstte hatýrlayacaðýmýz gibi A isimli fotoðrafýmýz dicom formatýndaydý. Detaylý olarak
             %özelliklerini görmek istediðimizde uygularýz.

             
Ib1=im2bw(A,0.1);% Segmentasyon yapabilmek amacýyla asýl fotoðrafýmýzý 0 ve 1(binary) haline dönüþtürüyoruz.
Ib2=im2bw(A,0.3);%Dönüþümü yaparken farklý farklý eþik deðerleri kullanarak deðiþimi görelim.
Ib3=im2bw(A,0.5);
Ib4=im2bw(A,0.7);
Ib5=im2bw(A,0.9);
Ib6=im2bw(A,1);
Im1=immultiply(Ib1,A);%Üstte resimleri farklý eþik deðerlerinde yalnýzca 0 ve 1 lerden oluþur hale getirdik.
Im2=immultiply(Ib2,A);%burada da asýl fotoðrafla matrisin hücrelerini tek tek çarparak segmente edilmiþ 
Im3=immultiply(Ib3,A);%fotoðraflarý elde ediyoruz.
Im4=immultiply(Ib4,A);
Im5=immultiply(Ib5,A);
Im6=immultiply(Ib6,A);
imshow(Im1), figure(), imshow(Im2), figure(), imshow(Im3), figure(), imshow(Im4), figure(), imshow(Im5), figure(),imshow(Im6)


graythresh(A)%kafamýza göre eþik deðeri uyguladýk ama asýl threshold deðeri ne öðrenelim.
I=im2bw(A,0.335);%Ayný iþlemleri asýl threshold deðerini kullanarak da yaparsak.
Im=immultiply(I,A);
figure(),imshow(Im)
Im=immultiply(A,I); % Matrisleri çarparken element element çarptýðýmýzý yerlerini deðiþtirdiðimizde deðiþiklik olmamasý ile de ispatladýk.
figure(),imshow(Im)
