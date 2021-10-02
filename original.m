function original = original(fotoColorea, R, G, B)
    [filas, cols] = size(fotoColorea);
    cols = cols/3;
    verde = [0,255,0];
    azul = [0,0,255];    
    original = uint8(zeros(filas, cols, 3));
    
    for i=1:filas
        for j=1:cols
            r = R(i,j);
            g = G(i,j);
            b = B(i,j);
            
            
            if fotoColorea(i,j,1) == 0 && fotoColorea(i,j,2) == 255 && fotoColorea(i,j,3) == 0
                original(i,j,1) = r; 
                original(i,j,2) = g;
                original(i,j,3) = b;
            end
            
            if fotoColorea(i,j,1) == 0 && fotoColorea(i,j,2) == 0 && fotoColorea(i,j,3) == 255
                original(i,j,1) = r; 
                original(i,j,2) = g;
                original(i,j,3) = b;
            end
        end
    end
    
    figure(10)
    imshow(original);

    
end