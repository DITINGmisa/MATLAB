I=imread('carplate.jpg');
I1=rgb2gray(I); %转为灰度图
% imshow(I1);
I2=im2bw(I1,0.25); %#ok<*IM2BW>二值化
% imshow(I2);
I3=imresize(I2,[256 1024]);%更改尺寸
% imshow(I3);

% 确定参数以将各数字切割并缩放
p1=imcrop(I2,[9 1 129 210]);
p1=imresize(p1,[100 150]);
p2=imcrop(I2,[130 1 127 220]);
p2=imresize(p2,[100 150]);
p3=imcrop(I2,[248 1 127 240]);
p3=imresize(p3,[100 150]);
p4=imcrop(I2,[380 10 60 220]);
p4=imresize(p4,[100 150]);
p5=imcrop(I2,[440 20 120 230]);
p5=imresize(p5,[100 150]);
p6=imcrop(I2,[550 20 128 256]);
p6=imresize(p6,[100 150]);
p7=imcrop(I2,[670 20 128 256]);
p7=imresize(p7,[100 150]);
p8=imcrop(I2,[810 20 128 256]);
p8=imresize(p8,[100 150]);
% subplot(2,4,1),imshow(p1);
% subplot(2,4,2),imshow(p2);
% subplot(2,4,3),imshow(p3);
% subplot(2,4,4),imshow(p4);
% subplot(2,4,5),imshow(p5);
% subplot(2,4,6),imshow(p6);
% subplot(2,4,7),imshow(p7);
% subplot(2,4,8),imshow(p8);

% 放入黑色背景图中间
j1=zeros(256,256);
j2=zeros(256,256);
j3=zeros(256,256);
j4=zeros(256,256);
j5=zeros(256,256);
j6=zeros(256,256);
j7=zeros(256,256);
j8=zeros(256,256);
j1(79:178,54:203)=p1;
j2(79:178,54:203)=p2;
j3(79:178,54:203)=p3;
j4(79:178,54:203)=p4;
j5(79:178,54:203)=p5;
j6(79:178,54:203)=p6;
j7(79:178,54:203)=p7;
j8(79:178,54:203)=p8;
% subplot(2,4,1),imshow(j1);
% subplot(2,4,2),imshow(j2);
% subplot(2,4,3),imshow(j3);
% subplot(2,4,4),imshow(j4);
% subplot(2,4,5),imshow(j5);
% subplot(2,4,6),imshow(j6);
% subplot(2,4,7),imshow(j7);
% subplot(2,4,8),imshow(j8);

% 傅里叶变换
f1=fft2(j1);
f1 = fftshift(f1);
f1 = abs(f1);
f2=fft2(j2); 
f2 = fftshift(f2);
f2 = abs(f2);
f3=fft2(j3); 
f3 = fftshift(f3);
f3 = abs(f3);
f4=fft2(j4); 
f4 = fftshift(f4);
f4 = abs(f4);
f5=fft2(j5); 
f5 = fftshift(f5);
f5 = abs(f5);
f6=fft2(j6); 
f6 = fftshift(f6);
f6 = abs(f6);
f7=fft2(j7); 
f7 = fftshift(f7);
f7 = abs(f7);
f8=fft2(j8); 
f8 = fftshift(f8);
f8 = abs(f8);
% subplot(2,4,1),imshow(uint8(f1));
% subplot(2,4,2),imshow(uint8(f2));
% subplot(2,4,3),imshow(uint8(f3));
% subplot(2,4,4),imshow(uint8(f4));
% subplot(2,4,5),imshow(uint8(f5));
% subplot(2,4,6),imshow(uint8(f6));
% subplot(2,4,7),imshow(uint8(f7));
% subplot(2,4,8),imshow(uint8(f8));

% 平移/旋转/放缩/取反
t1=zeros(256,256);%平移
t1(100:199,104:253)=p1;
t2=imrotate(t1,90,'bilinear');%旋转
tp=imresize(p1,1.2);%放缩
t3=zeros(256,256);
t3(69:188,39:218)=tp;
t4=1-j1;%取反
ft1=fft2(t1);
ft1 = fftshift(ft1);
ft1 = abs(ft1);
ft2=fft2(t2);
ft2 = fftshift(ft2);
ft2 = abs(ft2);
ft3=fft2(t3);
ft3 = fftshift(ft3);
ft3 = abs(ft3);
ft4=fft2(t4);
ft4 = fftshift(ft4);
ft4 = abs(ft4);
% subplot(2,5,1),imshow(j1),title('原图');
% subplot(2,5,2),imshow(t1),title('平移');
% subplot(2,5,3),imshow(t2),title('旋转');
% subplot(2,5,4),imshow(t3),title('放缩');
% subplot(2,5,5),imshow(t4),title('取反');
% subplot(2,5,6),imshow(uint8(f1)),title('原图频谱图');
% subplot(2,5,7),imshow(uint8(ft1)),title('平移频谱图');
% subplot(2,5,8),imshow(uint8(ft2)),title('旋转频谱图');
% subplot(2,5,9),imshow(uint8(ft3)),title('放缩频谱图');
% subplot(2,5,10),imshow(uint8(ft4)),title('取反频谱图');
