%Ex4_3 Contrast Limited Adaptive Histogram Equalization (CLAHE)
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pkg load image;
%load test image
Img = imread('moon.jpg');

%perform image histogram and find the max count
[count, bins] = imhist(Img);
maxCount = max(count(:));

%loop over different ratios
clipRatio = [1 0.7 0.4 0.05]; %ratio = 1: no clipping, ratio = 0.7: clip from 70%
limitedEq_Img = cell(1, numel(clipRatio));
LUT = uint8(zeros(numel(clipRatio), 256));
for i = 1 : numel(clipRatio)
  %clip histogram
  clip = clipRatio(i) * maxCount;
  clippedCount = (count < clip) .* count + (count >= clip) * clip;

  %construct one-dimensional virtual image for histeq to get mapping function
  clipped_Img = []; %create an empty image
  for level = 0 : 255
    clipped_Img = cat(2, clipped_Img, level * ones(1, clippedCount(level + 1)));
  end
  [temp, T] = histeq_modified(uint8(clipped_Img));

  %apply the mapping function
  LUT(i,:) = uint8(T * 255);
  limitedEq_Img(i) = intlut(Img, LUT(i,:));
end

%show images
figure(1), clf;
FS = 15; %fontsize of caption
for i = 1 : numel(clipRatio)
  subplot(1, numel(clipRatio), i), imshow(limitedEq_Img{i});
  title(['Clip at ' num2str(clipRatio(i)) ' max'], "fontsize", FS);
end
saveas(1, 'CLAHE.png');

%show histogram
figure(2), clf;
set(gcf, 'Position', [100 100 600 300]);
subplot(1,2,1), bar(bins, count), axis([0 255 0 max(count(:))+500]);
set(gca, "fontsize", FS); grid on;
subplot(1,2,2), plot(LUT(1:4,:)', 'LineWidth', 1.5); axis([0 255 0 255]);
set(gca, "fontsize", FS); set(gcf, 'Color', 'white');
