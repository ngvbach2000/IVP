%Ex2_2 Digitization: Sampling and Quantization
clear, clc, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load test image
Img = double(imread('tiger.jpg'));

%display the original image with different number of bits
FS = 15; %fontsize of caption
for NumOfBit = 1 : 8
  %quantize image to a given number of bit(s)
  NumOfLevel = 2 .^ NumOfBit; %number of levels
  LevelGap = 256 / NumOfLevel; %difference between two adjacent levels
  quantized_Img = uint8(ceil(Img / LevelGap) * LevelGap - 1);

  %display image
  subplot(2,4,NumOfBit);
  imshow(quantized_Img);

  %image caption
  if (1 == NumOfBit)
    name = [num2str(NumOfBit) '-bit'];
  else
    name = [num2str(NumOfBit) '-bits'];
  endif
  title(name, "fontsize", FS);

  %save image
  imwrite(quantized_Img, ['Quantization_in_' name '.jpg']);
end
