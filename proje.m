function [sonuc] = proje(image) %#ok<STOUT> 
img = imread(image);%Monokrom  Resim dışarıdan fonksiyona gönderildi ve burada  okundu.
[A,B] = size(img); %Resmin Matrissel karşılığındaki  Satir ve Sütun degerlerini atadım.
boyut = A*B;%TOPLAM piksel boyutunu çıkarıyorum.
olasilik=img; %Gelen resmin boyutunda 2 yedek değişken yarattım.
sonmatris=img;
for i=1:A
    for j=1:B
        sayi = img(i,j);%Resimde hangi sayidan kaç adet var olduğunu bu for döngüleri ile buluyoruz.
        sayac = 0;  
        for z=1:A
             for k=1:B
                if sayi == img(z,k)
sayac=sayac+1; %Burada hangi sayıdan kaç adet olduğunu bulup daha sonra olasılık hesabında kullanıyorum.
                end
            end
        end
olasilik(i,j) = (sayac / boyut)> 0.004;% (sayac/boyut) 0.004 den büyükse TRUE olacağından Olasilik matrisine 1 yazacak Küçükse FALSE olacağından 0 yazacak. 
    end
end
imwrite(olasilik,'olasilikdegerleri.jpg');% 0 ve 1 lerin bulunduğu matrisi, çıktı olarak alıyorum.
% Çünkü daha sonra imread(olasilikdegerleri.jpg) ile 0 ve 1 değerlerini görüp hata analizi yapıyorum.0 ve 1 lerin bulunduğu resim siyaha yani 0 ‘a  çok yakın olduğu için çıktı simsiyah olacak.
for i=1:A
    for j=1:B
        if olasilik(i,j)==1 % Olasilik Matrisinde 1 olan yerleri 255 yapıyorum. Yani BEYAZ olması gerektiğinden 1 olan yerleri 255 ile değiştiriyoruz. 
sonmatris(i,j)=255;
        elseif olasilik(i,j)<1 %Ayni şekilde 0 olan yerler ise 0 olarak kalmaya devam ediyor.
sonmatris(i,j)=0;
        end
    end
end
imshow(sonmatris);%Siyah beyaz olan Binary resmin çıktısı bu şekilde bulunup ekrana gösterilmiş oldu.
imwrite(sonmatris,'siyahbeyazGi.jpg');
end

