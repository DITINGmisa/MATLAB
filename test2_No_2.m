I = imread('5.png');%读入图像
I = rgb2gray(I);%转换为灰度图

J = dct2(I);%离散余弦变换
J1=J,J2=J;
J1(abs(J) >2000) = 0;%绝对值大于2000的置0，丢低频
J2(abs(J) < 50) = 0;%绝对值小于50的置0，丢高频

K = idct2(J)/255;%逆离散余弦变换还原
K1 = idct2(J1)/255
K2 = idct2(J2)/255

figure;imshow(I),title('原图');
figure;
subplot(2,3,1),imshow(log(abs(J)),[]),title('无丢弃');
subplot(2,3,2),imshow(log(abs(J1)),[]),title('丢低频');
subplot(2,3,3),imshow(log(abs(J2)),[]),title('丢高频');
subplot(2,3,4),imshow(K);
subplot(2,3,5),imshow(K1);
subplot(2,3,6),imshow(K2);
