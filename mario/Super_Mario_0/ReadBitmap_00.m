[RGB_SuperMario,map] = imread('Super Mario.gif');

imshow(RGB_SuperMario,map);

Im = ind2rgb(RGB_SuperMario,map);
RGB_RGB_SuperMario_red = round(Im(1:64,1:32,1).*7);
RGB_RGB_SuperMario_green = round(Im(1:64,1:32,2).*7);
RGB_RGB_SuperMario_blue = round(Im(1:64,1:32,3).*7);

red_fileID = fopen('SuperMarioRed_0.txt','w');
green_fileID = fopen('SuperMarioGreen_0.txt','w');
blue_fileID = fopen('SuperMarioBlue_0.txt','w');

for i = 1:64
    for j = 1:32
        fprintf(red_fileID,'%d\n',RGB_RGB_SuperMario_red(i,j));
        fprintf(green_fileID,'%d\n',RGB_RGB_SuperMario_green(i,j));
        fprintf(blue_fileID,'%d\n',RGB_RGB_SuperMario_blue(i,j));
    end
end