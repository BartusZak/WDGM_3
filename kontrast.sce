function kontrast(img,a)
    img = uint16(img);
    img = rgb2gray(img);
    [h w] = size(img);
    
    for i=1:256
        if (a*(i-127)+127) < 0 then
            LUT(i) = 0;
        elseif (a*(i-127)+127) >= 0 & (a*(i-127)+127) <= 255 then
            LUT(i) = (a*(i-127)+127);
        elseif (a*(i-127)+127) > 255 then
            LUT(i) = 255;
        end
    end
    
    for i=1:h
        for j=1:w
            out(i,j) = LUT(img(i,j));
        end 
    end
    
    out = uint8(out);
    imshow(out);
    
    //X=0:1:255;
   // plot(X,LUT);    
    
endfunction  

img = imread('lena.jpg');
kontrast(img,1.45);            
