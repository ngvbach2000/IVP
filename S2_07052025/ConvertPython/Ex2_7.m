%Ex2_7 Subtracting two images
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;

%load test images
live = im2double(imread('live.jpg'));
mask = im2double(imread('mask.jpg'));
diff_Img = imabsdiff(live,mask) .^ 0.4;

%plot images
FS = 15; %fontsize of caption
figure, clf;
subplot(1,3,1), imshow(live, [0 1]), title('live', "fontsize", FS);
subplot(1,3,2), imshow(mask, [0 1]), title('mask', "fontsize", FS);
subplot(1,3,3), imshow(diff_Img, [0 1]), title('Subtraction Image', "fontsize", FS);

%save image
saveas(gcf, 'Subtraction Image.jpg');
