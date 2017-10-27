function RGBrozjasnij(img, b)
    img = uint16(img);
    [h w] = size(img);

    
    for i=1:256
        if(i+b<0) then
            LUT(i) = 0;
        end
        if (i+b >= 0 & i+b <= 255 ) then
            LUT(i) = i+b;
        end
        if(i+b>255) then
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
    X=0:1:255;
    plot(X,LUT,'-g');
endfunction

img = imread('lena.jpg');
RGBrozjasnij(img,-50);
