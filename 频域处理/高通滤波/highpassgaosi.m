%高斯高通
I=imread('aaa.tif');
figure(2);
subplot(221),imshow(I);
title('原图像');
Y=fft2(im2double(I));%傅里叶变换
Y=fftshift(Y);%频谱搬移,直流分量搬移到频谱中心
subplot(222), imshow(log(abs(Y)+1),[]); 
title('图像傅里叶变换取对数所得频谱');
[M,N]=size(Y);%获得图像的高度和宽度
h=zeros(M,N);%滤波器函数
%图像中心点
M0=M/2;
N0=N/2;
%截至频率距离圆点的距离，delta表示高斯曲线的扩散程度
D0=40;
delta=D0;
for x=1:M
    for y=1:N
        %计算点（x,y）到中心点的距离
        d2=(x-M0)^2+(y-N0)^2;
        %计算高斯滤波器
        h(x,y)=1-exp(-d2/(2*delta^2));
    end
end
%滤波后结果
res=h.*Y;
res=real(ifft2(ifftshift(res)));
subplot(223),imshow(res);
title('高斯高通滤波所得图像'); 
subplot(224),imshow(h);
title("高斯高通滤波器图象");