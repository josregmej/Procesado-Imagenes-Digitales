%CARGAR IMAGENES: 

%Galicia:
img_NIR_post = imread("Galicia/S2A_tile_20171022_29TNG_0_NIR.TIF"); 
img_SWIR_post = imread("Galicia/S2A_tile_20171022_29TNG_0_SWIR2.TIF");
img_G_post = imread("Galicia/S2A_tile_20171022_29TNG_0_G.TIF");
img_R_post = imread("Galicia/S2A_tile_20171022_29TNG_0_R.TIF");

img_NIR_pre = imread("Galicia/S2A_tile_20170813_29TNG_0_NIR.TIF"); 
img_SWIR_pre = imread("Galicia/S2A_tile_20170813_29TNG_0_SWIR2.TIF");

%Doñana:
%img_NIR_post = imread("Doñana/Doñana_2017-08-04_NIR.TIF"); 
%img_SWIR_post = imread("Doñana/Doñana_2017-08-04_SWIR.TIF");
%img_G_post = imread("Doñana/Doñana_2017-08-04_G.TIF");
%img_R_post = imread("Doñana/Doñana_2017-08-04_R.TIF");

%img_NIR_pre = imread("Doñana/Doñana_2017-06-17_NIR.TIF");
%img_SWIR_pre = imread("Doñana/Doñana_2017-06-17_SWIR.TIF");

%img_G_pre = imread("Doñana/Doñana_2017-08-04_G.TIF");
%img_R_pre = imread("Doñana/Doñana_2017-08-04_R.TIF");
%img_B_pre = imread("Doñana/Doñana_2017-08-04_B.TIF");


%Calculamos el NBR de las imágenes posterir y anterior al fuego
NBRpost = imgNBR(img_NIR_post, img_SWIR_post); 
figure(9);
imshow(NBRpost);
NBRpre = imgNBR(img_NIR_pre, img_SWIR_pre);
figure(10);
imshow(NBRpre);

%Se aplica un suavizado de gaus previo al dNBR para eliminar la mayor cantidad de ruido posible
gausPre = imgaussfilt(NBRpre, 8);
gausPost = imgaussfilt(NBRpost, 8);
dNBR = dNBR(gausPre, gausPost);

NDVI = imgNDVI(img_NIR_post, img_R_post);
NDWI = imgNDWI(img_NIR_post, img_G_post);

color = colorea(dNBR, NDWI, NDVI);
imshow(color);