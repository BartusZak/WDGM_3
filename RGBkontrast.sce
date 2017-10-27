function RGBkontrast(img,a)
    img = uint16(img);
    
    [h w d] = size(img);

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
                out(i,j,1) = LUT(img(i,j,1));
                out(i,j,2) = LUT(img(i,j,2));
                out(i,j,3) = LUT(img(i,j,3));
            end 
        end
    
    out = uint8(out);
    //imshow(out);
   
    X  = 1:1:256; 
    plot(X,LUT,'-g');  //generowanie wykresu LUT

endfunction  

img = imread('lena.jpg');
RGBkontrast(img,1.45);            
