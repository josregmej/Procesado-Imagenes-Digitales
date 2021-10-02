function NDWI = imgNDWI(imgNIR, imgG)
    imgG = im2double(imgG); %Pasamos a double para poder trabajar con ellas
    imgNIR = im2double(imgNIR);
    [filasNIR, colsNIR] = size(imgNIR);
    NDWI = zeros(filasNIR, colsNIR, 'double');
    
    %Obtenemos el nivel nuevo digital
    for i=1:filasNIR
        for j = 1:colsNIR
            ndG = imgG(i,j); %Nivel digital de SWIR
            ndNIR = imgNIR(i,j); %Nivel digital de NIR
            ndp = (ndG - ndNIR) / (ndG + ndNIR);
            NDWI(i, j) = ndp;
        end
    end
end