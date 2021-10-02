function [colorea, superficie] = colorea(dNBR, NDWI, NDVI)
    [filas, cols] = size(dNBR);
    rojo = [255,0,0];
    verde = [0,255,0];
    naranja = [255,128,0]; 
    amarillo = [248,255,15];
    negro = [0,0,0];
    azul = [0,0,255];
    colorea = uint8(zeros(filas, cols, 3));
    pixel = 0;
    
    for i=1:filas
        for j=1:cols
             ndNBR = dNBR(i,j); %Nivel digital
             ndNDWI = NDWI(i,j);
             ndNDVI = NDVI(i,j);
             if ndNBR <= 0.255 && ndNDWI < 0 %&& ndNDVI > 0.3
                ndp = verde;
            elseif  ndNBR <= 0.419 && ndNDWI < 0 %&& ndNDVI > 0.3
                ndp = naranja;
                pixel = pixel + 1;
            elseif ndNBR <= 0.660 && ndNDWI < 0 %&& ndNDVI > 0.3
                ndp = rojo;
                pixel = pixel + 1;
            elseif ndNBR > 0.660 && ndNDWI < 0 %&& ndNDVI > 0.3
                ndp = negro;
                pixel = pixel + 1;
            else
                ndp = azul;
            end
            colorea(i, j, :) = ndp;
        end
    end
    figure(6);
    imshow(colorea);
    superficie = pixel*20;
end