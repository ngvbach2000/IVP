import cv2
import matplotlib.pyplot as plt
import numpy as np

img = cv2.imread('tiger.jpg', cv2.IMREAD_GRAYSCALE).astype(np.float64)
plt.figure(figsize=(15, 6))
for i in range(1, 9):
    levels = 2 ** i
    step = 256 / levels
    quantized_img = np.ceil(img / step) * step - 1
    quantized_img = np.clip(quantized_img, 0, 255).astype(np.uint8)
    plt.subplot(2, 4, i)
    plt.imshow(quantized_img, cmap='gray')
    label = f"{i}-bit" if i == 1 else f"{i}-bits"
    plt.title(label, fontsize=15)
    plt.axis('off')
    cv2.imwrite(f"Quantization_in_{label}.jpg", quantized_img)
plt.show()