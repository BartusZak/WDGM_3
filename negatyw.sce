function negatyw(img) //deklarujemy funckję negatyw z parametrem img
    img = uint16(img);  //konwertujemy img do uint16
    img = rgb2gray(img); //zastępujemy obraz RGB obrazem w odcieniach szarości
    [h w] = size(img); //przypisujemy wielkość obrazu pod parametrem img zmiennym h i w
    
    X  = [0:1:255]'; //tworze tablice z transponowaniem od 0 do 255 co 1
    
    for i=1:256 //rozpoczynamy petle
        LUT(i) = 256-i; //kod 
    end
    
    for i=1:h
        for j=1:w
            out(i,j) = LUT(img(i,j));
        end
    end
    
    out = uint8(out); //wracamy do uint8 zeby wyswietlic obrazek
    
    imshow(out); //wyswietlamy obrazek
endfunction //zamykamy funkcję

img = imread('lena.jpg'); //przypisujemy zmiennej img obraz 
negatyw(img); //wysołujemy funkcję negatyw z argumentem img
