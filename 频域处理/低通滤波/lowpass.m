


% %理想低通
% I = imread('aaa.tif');
% figure(4);
% subplot(221),imshow(I);
% title('原图像');
% I=im2double(I);
% s=fftshift(fft2(I));%傅里叶变换，直流分量搬移到频谱中心
% subplot(222), imshow(log(abs(s)+1),[]); 
% title('图像傅里叶变换取对数所得频谱');
% [a,b]=size(s);
% h=zeros(a,b);%滤波器函数
% res=zeros(a,b);%保存结果
% a0=round(a/2);
% b0=round(b/2);
% d=40;
% for i=1:a 
%     for j=1:b 
%         distance=sqrt((i-a0)^2+(j-b0)^2);
%         if distance<=d
%             h(i,j)=1;
%         else
%             h(i,j)=0;
%         end
%     end
% end
% res=s.*h;
% res=real(ifft2(ifftshift(res)));
% subplot(223),imshow(res);
% title('理想低通滤波所得图像'); 
% subplot(224),imshow(h);
% title("理想低通滤波器图象");