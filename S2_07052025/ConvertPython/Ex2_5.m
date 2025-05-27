%Ex2_5 Adding two images
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;

%load test images
Ia = imread('prarie.jpg');
Ib = imread('giraffe.jpg');
Ib1 = imresize(Ib, [size(Ia,1) size(Ia,2)]);
Ic = imadd(Ia,Ib1);

%plot images
FS = 15; %fontsize of caption
figure, clf;
subplot(1,3,1), imshow(Ia), title('prarie', "fontsize", FS);
subplot(1,3,2), imshow(Ib), title('giraffe', "fontsize", FS);
subplot(1,3,3), imshow(Ic), title('Combination Image', "fontsize", FS);

%save image
saveas(gcf, 'Addition Image.jpg');
