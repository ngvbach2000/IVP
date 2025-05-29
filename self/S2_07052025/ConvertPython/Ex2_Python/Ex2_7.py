import cv2
import numpy as np
import matplotlib.pyplot as plt

I1 = cv2.imread('earth1.jpg') / 255.0
I2 = cv2.imread('earth2.jpg') / 255.0
I = I1 * I2 * I1 * I2
plt.figure(figsize=(8, 4))
plt.subplot(1, 2, 1), plt.imshow(I1), plt.title('earth 2D Image', fontsize=15), plt.axis('off')
plt.subplot(1, 2, 2), plt.imshow(I), plt.title('earth 3D Image', fontsize=15), plt.axis('off')
plt.show()
plt.savefig('earth_multiply.jpg')