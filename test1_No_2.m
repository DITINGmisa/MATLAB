a = imread('2.png');%读入图片
b = rgb2gray(a);%将图像转化为灰度图
b=imresize(b,[512 512]);%更改图片尺寸
[wid,hei]=size(b);%读取图片尺寸
% 4倍减采样
quartimg = zeros(wid/2+1,hei/2+1);%创建空矩阵
i1 = 1;
j1 = 1;
for i=1:2:wid %一重for循环，i自增2
    for j=1:2:hei %两重for循环，j自增2
        quartimg(i1,j1) = b(i,j); %令quartimg中(i1,j1)处的像素值等于b中(i,j)处的像素值
        j1 = j1 + 1; %j1自增1
    end
    i1 = i1 + 1; %i1自增1
    j1 = 1; %j1置1以进行下一行像素写入
end
% 16倍减采样
heximg = zeros(wid/4+1,hei/4+1);%创建空矩阵
i1 = 1;
j1 = 1;
for i=1:4:wid %一重for循环，i自增4
    for j=1:4:hei %两重for循环，j自增4
        heximg(i1,j1) = b(i,j); %令heximg中(i1,j1)处的像素值等于b中(i,j)处的像素值
        j1 = j1 + 1; %j1自增1
    end
    i1 = i1 + 1; %i1自增1
    j1 = 1; %j1置1以进行下一行像素写入
end
subplot(1,3,1),imshow(b),title('原图');%输出原图
subplot(1,3,2),imshow(uint8(quartimg)),title('4倍减采样');%输出4倍减采样图像
subplot(1,3,3),imshow(uint8(heximg)),title('16倍减采样');%输出4倍减采样图像
