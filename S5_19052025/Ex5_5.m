% Noise low pass filter (LPF)
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
img = imread('airplane.png');

%contruct three different filters
[wx, wy] = meshgrid(-pi : p/8 : pi : -pi : p/8 : pi);

%compute frequency responses
type = '1d_horizontal';
%type = '1d_vertical';
%type = '2d';

if strcmp(type, '2d') == 1
  %filter frequency domain
  a = (1/256) * (1 + 2*cos(wx) + 2*cos(2*wx)) .* (1 + 2 cos(wx) + 2*cos(2*wx));
  b = (1/256) * ones(16);

else if strcmp(type, '1d_horizontal') == 1
  a = (1/16) * (1 + 2*cos(wx) + 2*cos(2*wx));
  b = (1/16) * ones(1, 16);

  elseif strcmp(type, '1d_vertical') == 1
  a = (1/16) * (1 + 2*cos(wx) + 2*cos(2*wx));
  b = (1/16) * ones(16, 1);

end

figure(1), clf;
surf(wx/pi, wy/pi, abs(H)); axis([-1 1 -1 1 0 1]);
set (gca 'XTick', -1 : 0.5 : 1, 'YTick', -1 : 0.5 : 1);
xlabel('\omega_x / \pi'); ylabel('\omega_y / \pi');
zlabel('H|');

%show image
FS = 15;
figure(1), clf;

subplot(1,3,1), imshow(img), title('Original Image', "fontsize", FS);
subplot(1,3,2), imshow(img_salt), title('Salt Image', "fontsize", FS);
subplot(1,3,3), imshow(img_pepper), title('Pepper Image', "fontsize", FS);
saveas(1, 'Noise low pass filter (LPF).jpg');




