function rozjasnij(img, b)
    img = uint16(img);
    [h w] = size(img);
    
    LUT = zeros(256,1);
    
    X=0:1:255;
    
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
                out(i,j) = LUT(img(i,j));
            end
        end
    out = uint8(out);
    
    //plot(X,LUT);
    imshow(out);
endfunction
function rozjasnij2(img,b)
    img = uint16(img);
    img = rgb2gray(img);
    [h w] = size(img);
    
    for i=1:256
        if b>0 then
            LUT(i) = min(255,i+b); //rozjasnianie
        elseif b<0 then
            LUT(i) = max(0,i+b);   //przyciemnianie
        else
             LUT(i) = i+b; //nic nie rob
        end
    end
    
    for i=1:h
        for j=1:w
            out(i,j) = LUT(img(i,j));
        end
    end
    
    out = uint8(out);
    imshow(out);

endfunction


img = imread('lena.jpg');
rozjasnij2(img,50);
