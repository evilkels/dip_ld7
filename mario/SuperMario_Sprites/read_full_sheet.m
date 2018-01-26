[RGB_mario_full_sheet,map] = imread('characters.gif');

% imshow(RGB_mario_full_sheet,map);
Im = ind2rgb(RGB_mario_full_sheet,map);

FigureNumber = 1;
offset = 0;

figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Im);

Sprite1 = Im(1+2:32+2,1+1:16+1,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite1);


offset = offset + 16+4;
Sprite2 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite2);



offset = offset + 16+4-2;
Sprite3 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite3);

offset = offset + 16+2;
Sprite4 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite4);


offset = offset + 16+3;
Sprite5 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite5);

offset = offset + 16+3;
Sprite6 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite6);

offset = offset + 16+1;
Sprite7 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite7);
% 
offset = offset + 16+1;
Sprite8 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite8);


offset = offset + 16+3;
Sprite9 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite9);


offset = offset + 16+3;
Sprite10 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite10);


offset = offset + 16+2;
Sprite11 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite11);

offset = offset + 16+1;
Sprite12 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite12);


offset = offset + 16+3;
Sprite13 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite13);

offset = offset + 16+3;
Sprite14 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite14);

offset = offset + 16+3;
Sprite15 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite15);

imwrite(RGB_mario_full_sheet(1+2:32+2,1+offset:16+offset),map,'Mario.gif','GIF');



offset = offset + 16+3;
Sprite16 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite16);

imwrite(RGB_mario_full_sheet(1+2:32+2,1+offset:16+offset),map,'MarioDuck.gif','GIF');

offset = offset + 16+3;
Sprite17 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite17);

imwrite(RGB_mario_full_sheet(1+2:32+2,1+offset:16+offset),map,'MarioWalk0.gif','GIF');

offset = offset + 16+3;
Sprite18 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite18);

imwrite(RGB_mario_full_sheet(1+2:32+2,1+offset:16+offset),map,'MarioWalk1.gif','GIF');

offset = offset + 16;
Sprite19 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite19);

imwrite(RGB_mario_full_sheet(1+2:32+2,1+offset:16+offset),map,'MarioWalk2.gif','GIF');

offset = offset + 16+3;
Sprite20 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite20);

offset = offset + 16+3;
Sprite21 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite21);

offset = offset + 16+3;
Sprite22 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite22);


offset = offset + 16+1;
Sprite23 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite23);


offset = offset + 16+1;
Sprite24 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite24);


offset = offset + 16+3;
Sprite25 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite25);

offset = offset + 16+3;
Sprite26 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite26);

offset = offset + 16+1;
Sprite27 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite27);


offset = offset + 16+3;
Sprite28 = Im(1+2:32+2,1+offset:16+offset,:);
figure(FigureNumber)
FigureNumber = FigureNumber+1;
imshow(Sprite28);

%##########################################################################
% Sprite15, Sprite16, sprite18,19,20

RGB_Sprite15_red = round(Sprite15(1:32,1:16,1).*7);
RGB_Sprite15_green = round(Sprite15(1:32,1:16,2).*7);
RGB_Sprite15_blue = round(Sprite15(1:32,1:16,3).*7);

red_fileID = fopen('Sprite15Red_0.txt','w');
green_fileID = fopen('Sprite15Green_0.txt','w');
blue_fileID = fopen('Sprite15Blue_0.txt','w');

for i = 1:32
    for j = 1:16
        fprintf(red_fileID,'%d\n',RGB_Sprite15_red(i,j));
        fprintf(green_fileID,'%d\n',RGB_Sprite15_green(i,j));
        fprintf(blue_fileID,'%d\n',RGB_Sprite15_blue(i,j));
    end
end

RGB_Sprite17_red = round(Sprite17(1:32,1:16,1).*7);
RGB_Sprite17_green = round(Sprite17(1:32,1:16,2).*7);
RGB_Sprite17_blue = round(Sprite17(1:32,1:16,3).*7);

for i = 1:32
    for j = 1:16
        fprintf(red_fileID,'%d\n',RGB_Sprite17_red(i,j));
        fprintf(green_fileID,'%d\n',RGB_Sprite17_green(i,j));
        fprintf(blue_fileID,'%d\n',RGB_Sprite17_blue(i,j));
    end
end


RGB_Sprite18_red = round(Sprite18(1:32,1:16,1).*7);
RGB_Sprite18_green = round(Sprite18(1:32,1:16,2).*7);
RGB_Sprite18_blue = round(Sprite18(1:32,1:16,3).*7);

for i = 1:32
    for j = 1:16
        fprintf(red_fileID,'%d\n',RGB_Sprite18_red(i,j));
        fprintf(green_fileID,'%d\n',RGB_Sprite18_green(i,j));
        fprintf(blue_fileID,'%d\n',RGB_Sprite18_blue(i,j));
    end
end


RGB_Sprite19_red = round(Sprite19(1:32,1:16,1).*7);
RGB_Sprite19_green = round(Sprite19(1:32,1:16,2).*7);
RGB_Sprite19_blue = round(Sprite19(1:32,1:16,3).*7);

for i = 1:32
    for j = 1:16
        fprintf(red_fileID,'%d\n',RGB_Sprite19_red(i,j));
        fprintf(green_fileID,'%d\n',RGB_Sprite19_green(i,j));
        fprintf(blue_fileID,'%d\n',RGB_Sprite19_blue(i,j));
    end
end

RGB_Sprite16_red = round(Sprite16(1:32,1:16,1).*7);
RGB_Sprite16_green = round(Sprite16(1:32,1:16,2).*7);
RGB_Sprite16_blue = round(Sprite16(1:32,1:16,3).*7);

for i = 1:32
    for j = 1:16
        fprintf(red_fileID,'%d\n',RGB_Sprite16_red(i,j));
        fprintf(green_fileID,'%d\n',RGB_Sprite16_green(i,j));
        fprintf(blue_fileID,'%d\n',RGB_Sprite16_blue(i,j));
    end
end


red_fileID_1 = fopen('Mario_Red.txt','w');
green_fileID_1 = fopen('Mario_Green.txt','w');
blue_fileID_1 = fopen('Mario_Blue.txt','w');

for i = 1:32
    for j = 1:16
        fprintf(red_fileID_1,'%d\n',RGB_Sprite15_red(i,j));
        fprintf(green_fileID_1,'%d\n',RGB_Sprite15_green(i,j));
        fprintf(blue_fileID_1,'%d\n',RGB_Sprite15_blue(i,j));
    end
end


red_fileID_2 = fopen('MarioWalk0_Red.txt','w');
green_fileID_2 = fopen('MarioWalk0_Green.txt','w');
blue_fileID_2 = fopen('MarioWalk0_Blue.txt','w');

for i = 1:32
    for j = 1:16
        fprintf(red_fileID_2,'%d\n',RGB_Sprite17_red(i,j));
        fprintf(green_fileID_2,'%d\n',RGB_Sprite17_green(i,j));
        fprintf(blue_fileID_2,'%d\n',RGB_Sprite17_blue(i,j));
    end
end


red_fileID_3 = fopen('MarioWalk1_Red.txt','w');
green_fileID_3 = fopen('MarioWalk1_Green.txt','w');
blue_fileID_3 = fopen('MarioWalk1_Blue.txt','w');

for i = 1:32
    for j = 1:16
        fprintf(red_fileID_3,'%d\n',RGB_Sprite18_red(i,j));
        fprintf(green_fileID_3,'%d\n',RGB_Sprite18_green(i,j));
        fprintf(blue_fileID_3,'%d\n',RGB_Sprite18_blue(i,j));
    end
end

red_fileID_4 = fopen('MarioWalk2_Red.txt','w');
green_fileID_4 = fopen('MarioWalk2_Green.txt','w');
blue_fileID_4 = fopen('MarioWalk2_Blue.txt','w');

for i = 1:32
    for j = 1:16
        fprintf(red_fileID_4,'%d\n',RGB_Sprite19_red(i,j));
        fprintf(green_fileID_4,'%d\n',RGB_Sprite19_green(i,j));
        fprintf(blue_fileID_4,'%d\n',RGB_Sprite19_blue(i,j));
    end
end

red_fileID_5 = fopen('MarioDuck0_Red.txt','w');
green_fileID_5 = fopen('MarioDuck0_Green.txt','w');
blue_fileID_5 = fopen('MarioDuck0_Blue.txt','w');

for i = 1:32
    for j = 1:16
        fprintf(red_fileID_5,'%d\n',RGB_Sprite19_red(i,j));
        fprintf(green_fileID_5,'%d\n',RGB_Sprite19_green(i,j));
        fprintf(blue_fileID_5,'%d\n',RGB_Sprite19_blue(i,j));
    end
end

% imwrite(Im(1+2:32+2,1+offset:16+offset,:);,map,Mario,GIF);


