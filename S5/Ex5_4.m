%Ex5_4 Noise Salt/Pepper Filtering
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
Img = im2double(imread('coins.tif'));
Img_salt = im2double(imread('coins_salt.jpg'));
Img_pepper = im2double(imread('coins_pepper.jpg'));

%show images
FS = 15; %fontsize of caption
figure(1), clf;
subplot(1,3,1), imshow(Img), title('Original Image', "fontsize", FS);
subplot(1,3,2),  imshow(Img_salt), title('Salt Noise Image', "fontsize", FS);
subplot(1,3,3),  imshow(Img_pepper), title('Pepper Noise Image', "fontsize", FS);
saveas(1, 'Original and Noisy Images.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%filter noisy images
Img_fix1 = colfilt(Img_salt, [4 4], 'sliding', @min);
Img_fix2 = colfilt(Img_pepper, [4 4], 'sliding', @max);
Img_fix3 = colfilt(Img_salt, [4 4], 'sliding', @max);
Img_fix4 = colfilt(Img_pepper, [4 4], 'sliding', @min);

figure(2), clf;
subplot(2,2,1), imshow(Img_fix1), title('Salt Denoise Image', "fontsize", FS);
subplot(2,2,2), imshow(Img_fix2), title('Pepper Denoise Image', "fontsize", FS);
subplot(2,2,3), imshow(Img_fix3), title('Salt Wrongly Denoise Image', "fontsize", FS);
subplot(2,2,4), imshow(Img_fix4), title('Peppe Wrongly Denoise Image', "fontsize", FS);
saveas(2, 'Denoise Images.jpg');
