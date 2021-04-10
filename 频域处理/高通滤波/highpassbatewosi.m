%巴特沃斯高通
figure(3);
I=imread('aaa.tif');
subplot(221),imshow(I);
title('原始图像');
Y=fft2(im2double(I));%傅里叶变换
Y=fftshift(Y);%频谱搬移,直流分量搬移到频谱中心
subplot(222), imshow(log(abs(Y)+1),[]); 
title('图像傅里叶变换取对数所得频谱');
[M,N]=size(Y);%获得图像的高度和宽度
h=zeros(M,N);%滤波器函数
%图像中心点
M0=M/2;
N0=N/2;
d0=40;
%巴特沃斯滤波器的阶数
n_0=2;
for x=1:M
    for y=1:N
        distance=sqrt((x-M0)^2+(y-N0)^2);
        h(x,y)=1/(1+(d0/distance)^(2*n_0));
    end
end
%滤波后结果
res=h.*Y;
res=real(ifft2(ifftshift(res)));
subplot(223),imshow(res);
title('巴特沃斯高通滤波所得图像'); 
subplot(224),imshow(h);
title("巴特沃斯高通滤波器图象");


