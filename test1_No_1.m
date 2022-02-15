% 1.1.1 imread 函数用来实现图像文件的读取
% A=imread('1.png');
% imshow(A);
% 
% 1.1.2 imwrite 函数用来实现图像文件的写入
% imwrite(A,'2.png');
% 
% 1.1.3 imfinfo 函数用来查询图像文件信息
% info=imfinfo('1.png');
% w=info.Width;

% 1.1.4 subimage 函数实现在一个图形窗口中显示多幅图像
% RGB=imread('2.png');
% I=rgb2gray(RGB);
% subplot(1,2,1),subimage(RGB)
% subplot(1,2,2),subimage(I)

% 1.2.1 imresize 函数实现图像的缩放
% J=imread('drum.bmp');
% X1=imresize(J,2); %2是2倍的意思
% figure,imshow(J)

% J=imread('1.png');
% X1=imresize(J,[20 50]);
% figure,imshow(X1)

% 1.2.2 imrotate 函数实现图像的旋转
% I=imread('1.png');
% J=imrotate(I,90,'bilinear');
% subplot(1,2,1),imshow(I);
% subplot(1,2,2),imshow(J);

% 1.2.3 imcrop 函数实现图像的剪切
% I=imread('1.png');
% I1=imcrop(I,[75 68 130 112]);
% subplot(1,2,1),imshow(I);
% subplot(1,2,2),imshow(I1);

% 1.2.4 roicolor对 RGB 图像和灰度图像实现按灰度或亮度值选择区域进行处理
% A=imread('2.png');
% I=rgb2gray(A);
% BW=roicolor(I,15,150);
% subplot(1,2,1),imshow(I);
% subplot(1,2,2),imshow(BW)

% 1.3.1 imadd 函数实现两幅图像的相加或者给一幅图像加上一个常数。给图像每个像素都增加亮度
% I=imread('2.png');
% J=imadd(I,100); 
% subplot(1,2,1),imshow(I)
% subplot(1,2,2),imshow(J)

% 1.3.2 imsubtract 函数实现将一幅图像从另一幅图像中减去，或者从一幅图像中减去一个常数
% I=imread('2.png');
% J=imsubtract(I,150); 
% subplot(1,2,1),imshow(I)
% subplot(1,2,2),imshow(J)

% 1.3.3 immultiply 实现两幅图像的相乘或者一幅图像的亮度缩放
% I=imread('6.png');
% J=imread('f1.jpg');
% K=immultiply(I,J);
% subplot(1,3,1),imshow(I)
% subplot(1,3,2),imshow(J)
% subplot(1,3,3),imshow(K)

% 1.3.4 imdivide 函数实现两幅图像的除法或一幅图像的亮度缩放
% I=imread('2.png');
% J=imdivide(I,0.5); %图像的亮度缩放
% subplot(1,2,1),imshow(I)
% subplot(1,2,2),imshow(J)

% 1.4.1 imhist 函数产生图像的直方图
% A=imread('2.png'); 
% B=rgb2gray(A); 
% imshow(B);
% imhist(B);
% 
% 1.4.2 histeq 函数用于对图像的直方图均衡化
% C=histeq(B); 
% imshow(C);
% imhist(C);

% 1.4.3 线性与非线性灰度映射
% I=imread('2.png');
% subplot(1,3,1);
% imshow(I);
% title('原图');
% J=imadjust(I,[0.3;0.6],[0.2;0.5]); %设置输入/输出变换的灰度级范围，a=0.3, b=0.6, c=0.1, d=0.9。
% subplot(1,3,2);
% imshow(J);
% title('线性映射(a=0.3, b=0.6, c=0.1, d=0.9)');
% I1=double(I); 
% I2=I1/255; 
% C=1;% 设置非线性映射函数的参数c=1。
% K=C*log(1+I2); %求图像的对数变换
% subplot(1,3,3);
% imshow(K);
% title('非线性映射(C=1)');
% M=255-I; %将此图像取反
% figure;
% subplot(1,3,1);
% imshow(M);
% title('灰度倒置');
% N1=im2bw(I,0.5); %将此图像二值化，阈值为0.5
% N2=im2bw(I,0.8); %将此图像二值化，阈值为0.8
% subplot(1,3,2);
% imshow(N1);
% title('二值化阈值0.5');
% subplot(1,3,3);
% imshow(N2);
% title('二值化阈值0.8');

% 1.4.4 函数实现均值滤波。
% a=imread('2.png');
% I=rgb2gray(a);
% subplot(2,2,1),imshow(I);
% title('灰度图');
% K1=filter2(fspecial('average',3),I)/255; %3×3 的均值滤波
% K2=filter2(fspecial('average',5),I)/255; %5×5 的均值滤波
% K3=filter2(fspecial('average',7),I)/255; %7×7 的均值滤波
% subplot(2,2,2),imshow(K1);
% title('3×3均值滤波');
% subplot(2,2,3),imshow(K2);
% title('5×5均值滤波');
% subplot(2,2,4),imshow(K3);
% title('7×7均值滤波');

% 1.4.5 medfilt2 函数实现中值滤波。
% a=imread('2.png');
% I=rgb2gray(a);
% subplot(2,2,1),imshow(I);
% title('灰度图');
% K1=medfilt2(I,[3,3]); %3×3 中值滤波
% K2=medfilt2(I,[5,5]); %5×5 中值滤波
% K3=medfilt2(I,[7,7]); %7×7 中值滤波
% subplot(2,2,2),imshow(K1);
% title('3×3中值滤波');
% subplot(2,2,3),imshow(K2);
% title('5×5中值滤波');

% %去噪效果对比
% a=imread('2.png');
% I=rgb2gray(a);
% P1=imnoise(I,'gaussian',0.02);
% subplot(2,3,1),imshow(P1);
% title('高斯噪声');
% P2=imnoise(I,'salt & pepper',0.09);
% subplot(2,3,4),imshow(P2);
% title('椒盐噪声');
% K1=filter2(fspecial('average',3),P1)/255; %3×3 的均值滤波
% subplot(2,3,2),imshow(K1);
% title('3×3均值滤波');
% K2=medfilt2(P1,[3,3]); %3×3 中值滤波
% subplot(2,3,3),imshow(K2);
% title('3×3中值滤波');
% K3=filter2(fspecial('average',3),P2)/255; %3×3 的均值滤波
% subplot(2,3,5),imshow(K3);
% title('3×3均值滤波');
% K4=medfilt2(P2,[3,3]); %3×3 中值滤波
% subplot(2,3,6),imshow(K4);
% title('3×3中值滤波');

% 1.4.6 fft2 函数和ifft2 函数计算二维的傅里叶变换和反变换
% f=zeros(100,100);
% f(30:70,40:60)=1;
% subplot(2,2,1),imshow(f);
% title('f');
% F=fft2(f); 
% subplot(2,2,2),imshow(F);
% title('F');
% F1=ifft2(F);
% subplot(2,2,3),imshow(F1);
% title('F1');
% F2=log(abs(F)); %对幅值取对数
% subplot(2,2,4),imshow(F2),colorbar;
% title('F2');

% 1.4.7 fftshift函数实现补零操作和改变图像显示象限
% f=zeros(100,100);
% f(20:70,40:60)=1;
% imshow(f);
% F=fft2(f,256,256);
% F2=fftshift(F); %实现补零操作
% imshow(log(abs(F2)));

% 1.4.8 edge 函数用于提取图像的边缘。
% I=imread('cameraman.tif'); 
% BW1=edge(I,'canny'); 
% BW2=edge(I,'prewitt'); 
% BW3=edge(I,'sobel');
% BW4=edge(I,'roberts'); 
% BW5=edge(I,'log'); 
% subplot(2,3,1),imshow(I),title('I');
% subplot(2,3,2),imshow(BW1),title('canny');
% subplot(2,3,3),imshow(BW2),title('prewitt');
% subplot(2,3,4),imshow(BW3),title('sobel');
% subplot(2,3,5),imshow(BW4),title('roberts');
% subplot(2,3,6),imshow(BW5),title('log');











