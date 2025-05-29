%Ex7_5 Small Hole Removal using Closing
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
Img = imread('man_face.png');

%binarize the input image
BW = Img < 112; %manual threshold

%perform closing
se = strel('square', 22);
Img_dilated = imdilate(BW, se); %dilation first
Img_closed = imerode(Img_dilated, se); %erosion then
Img_diff = Img_closed - BW;

%show images
FS = 15; %fontsize of caption
figure, clf;
subplot(2,2,1), imshow(BW), title('Binary Image', "fontsize", FS);
subplot(2,2,2), imshow(Img_dilated), title('Dilated Image', "fontsize", FS);
subplot(2,2,3), imshow(Img_closed), title('Closed Image', "fontsize", FS);
subplot(2,2,4), imshow(Img_diff), title('Closing - Binary', "fontsize", FS);
saveas(gcf, 'Hole Removal using Closing.jpg');
