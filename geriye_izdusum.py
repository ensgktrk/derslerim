import cv2 #Kütüphaneleri yüklediğinizden emin olunuz.
import random
import numpy as np
"""

Bu çalışmada istediğimiz bir fotoğrafın önce
Satır ve Sütun izdüşümlerini hesaplaycağız
Çıkan sonuçlara göre, fotoğraf elimizde yokmuşgibi
Basit Geriye İzdüşüm Metodu ile
İmgeyi elde edeceğiz.

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
    return sutun_iz


#Geriye İzdüşüm Hesaplayalım
def geriyeizdusum(matris,satir,sutun):
    satir_iz=satirizdusum(matris)
    sutun_iz=sutunizdusum(matris)
    #satir,sutun=matris.shape
    
    
    for i in range(satir):
        yeni_matris=np.zeros((satir,sutun))
        for j in range(sutun):
            aratoplam=(satir_iz[i]/(len(satir_iz)))+(sutun_iz[j]/(len(sutun_iz)))
            matris[i,j]=aratoplam
    print("Yeni Elde Edilen Matris:\n", matris)
    return matris
                             
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
geriyeizdusum(mat)
"""

foto_path='LENOVO/Desktop/foto.jpeg'
foto= cv2.imread(foto_path,0) # Gri olarak resmi belirtilen dosyadan aldık.
satir,sutun,kanal_sayisi =foto.shape # Satır Sütun sayısını bulduk.


geriyeizdusum(foto,satir,sutun)
            
        
        
