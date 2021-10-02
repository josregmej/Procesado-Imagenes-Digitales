function NBR = imgNBR(imgNIR, imgSWIR)
    imgSWIR = imresize(imgSWIR, 2);
    imgSWIR = im2double(imgSWIR); %Pasamos a double para poder trabajar con ellas
    imgNIR = im2double(imgNIR);
    [filasNIR, colsNIR] = size(imgNIR);
    NBR = zeros(filasNIR, colsNIR, 'double');
    
    %Obtenemos el nivel nuevo digital
    for i=1:filasNIR
        for j = 1:colsNIR
            ndSWIR = imgSWIR(i,j); %Nivel digital de SWIR
            ndNIR = imgNIR(i,j); %Nivel digital de NIR
            
            ndp = (ndNIR - ndSWIR) / (ndNIR + ndSWIR);
            NBR(i, j) = ndp;
        end
    end

    
    