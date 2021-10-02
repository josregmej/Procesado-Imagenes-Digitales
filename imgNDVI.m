function NDVI = imgNDVI(imgNIR, imgR)
    imgR = im2double(imgR); %Pasamos a double para poder trabajar con ellas
    imgNIR = im2double(imgNIR);
    [filasNIR, colsNIR] = size(imgNIR);
    NDVI = zeros(filasNIR, colsNIR, 'double');
    
    %Obtenemos el nivel nuevo digital
    for i=1:filasNIR
        for j = 1:colsNIR
            ndR = imgR(i,j); %Nivel digital de R
            ndNIR = imgNIR(i,j); %Nivel digital de NIR
            ndp = (ndNIR - ndR)/(ndNIR + ndR);
            NDVI(i, j) = ndp;
        end
    end
end