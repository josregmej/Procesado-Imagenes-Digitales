function dNBR = dNBR(imgPre, imgPost)
    [filasPre, colsPre] = size(imgPre);
    [filasPost, colsPost] = size(imgPost);
    
    %filas = 0;
    
    if filasPre <= filasPost
        filas = filasPre;
    else
        filas = filasPost;
    end
    
    %cols = 0;
    
    if colsPre <= colsPost
        cols = colsPre;
    else
        cols = colsPost;
    end
    
    dNBR = zeros(filas, cols, 'double');
    
    for i=1:filas
        for j = 1:cols
            ndPre = imgPre(i,j);
            ndPost = imgPost(i,j); 
            
            ndp = ndPre - ndPost;
            dNBR(i, j) = ndp;
        end
    end
end