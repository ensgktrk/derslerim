import opencv
import cv2 #Önce kütüphanelerin sizde yüklü olduğunda emin olun.
import random
import numpy as np
"""
Bu çalışmada istediğimiz bir dosyadan seçitiğimiz
fotoğrafa ait Satır, Sütun, Köşegen ve Ters Köşegen
İzdüşümlerinin bulunması işlemleri gerçekleştirilmiştir.

 ***************************************
 *                                     *
 *  Designed by "Goktug Enes Gokturk"  *
 *                                     *
 ***************************************
 
"""
#Satır İzdüşümlerinin Bulunması
def satirizdusum(matris,satir,sutun):
    satir_iz=[]
    #(satir,sutun)=matris.shape
    for i in range(satir):
        toplam=0
        for j in range(sutun):
            ara_toplam=matris[i,j]
            toplam=toplam+ara_toplam
        satir_iz.append(toplam)
    print("Satır İzdüşüm Değerleri:",satir_iz)
    return satir_iz

#Sütun İzdüşümlerinin Bulunması
def sutunizdusum(matris,satir,sutun):
    sutun_iz=[]
    #(satir,sutun)=matris.shape
    for i in range(sutun):
        toplam=0
        for j in range(satir):
            ara_toplam=matris[j,i]
            toplam=toplam+ara_toplam
        sutun_iz.append(toplam)
    print("Sutun İzdüşüm Değerleri:",sutun_iz)
    return sutun_iz

#Köşegen İzdüşümünün Bulunması
def kosegenizdusum(matris,satir,sutun):
    print("   DİKKAT! \n   'Köşegen' Foksiyonunu Kullanabilmek için Matrisiniz \n   Kare Formunda OLMALI")
    kosegen_iz=[]
    #(satir,sutun)=matris.shape
    if satir != sutun:
        print("Kare Matris DEĞİL")
    else:
        toplam=0
        for i in range(sutun):
            
            for j in range(satir):
                if i==j:
                    deger=matris[i,j]
                    toplam=toplam+deger
            kosegen_iz.append(toplam)
            kosegen_iz=[kosegen_iz[(len(kosegen_iz)-1)]]
            
    print("Köşegen İzdüşüm Değerleri:",kosegen_iz)
    return kosegen_iz

#Ters Köşegen İşdüşümünün Bulunması
def terskosegenizdusum(matris,satir,sutun):
    print("   DİKKAT! \n   'Ters Köşegen' Foksiyonunu Kullanabilmek için Matrisiniz \n   Kare Formunda OLMALI")
    terskosegen_iz=[]
    #(satir,sutun)=matris.shape
    if satir != sutun:
        print("Kare Matris DEĞİL")
    else:
        toplam=0
        for i in range(sutun):
            
            for j in range(satir):
                if (i+j==(sutun-1)):
                    deger=matris[i,j]
                    toplam=toplam+deger
            terskosegen_iz.append(toplam)
            terskosegen_iz=[terskosegen_iz[(len(terskosegen_iz)-1)]]
            
    print("Ters Köşegen İzdüşüm Değerleri:",terskosegen_iz)
    return terskosegen_iz

                             
"""
*********************************************
FOTOĞRAFSIZ KODU DENEMEK İSTEDİĞİNİZDE KULLAN
*********************************************
"""
"""
mat=np.matrix([[0,0,0,0,0],[10,10,10,10,10],[0,0,10,0,0],[0,0,10,0,0],[0,0,10,0,0]])
print(mat)
satirizdusum(mat)
sutunizdusum(mat)
kosegenizdusum(mat)
terskosegenizdusum(mat)
"""

foto_path='LENOVO/Desktop/foto.jpeg'
foto= cv2.imread(foto_path,0) # Gri olarak resmi belirtilen dosyadan aldık.
satir,sutun,kanal_sayisi =foto.shape # Satır Sütun sayısını bulduk.
                                     #(Gri olarak çalıştığımız için kanal sayısı '1'e eşit olur.)

satirizdusum(foto,satir,sutun)
sutunizdusum(foto,satir,sutun)
kosegenizdusum(foto,satir,sutun)
terskosegenizdusum(foto,satir,sutun)

            
        
        
