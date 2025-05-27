import cv2
import matplotlib.pyplot as plt

img = cv2.imread('nature.jpg')
img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
_, img_bw = cv2.threshold(img_gray, 127, 255, cv2.THRESH_BINARY)

plt.figure(figsize=(12, 4))
plt.subplot(1, 3, 1), plt.imshow(img_rgb), plt.title("Original Image", fontsize=15), plt.axis('off')
plt.subplot(1, 3, 2), plt.imshow(img_gray, cmap='gray'), plt.title("Grayscale Image", fontsize=15), plt.axis('off')
plt.subplot(1, 3, 3), plt.imshow(img_bw, cmap='gray'), plt.title("Binary Image", fontsize=15), plt.axis('off')
plt.show()
plt.savefig("Image_in_different_type.jpg")

cv2.imwrite('nature100.jpg', img)
cv2.imwrite('nature75.jpg', img, [int(cv2.IMWRITE_JPEG_QUALITY), 75])
cv2.imwrite('nature10.jpg', img, [int(cv2.IMWRITE_JPEG_QUALITY), 10])