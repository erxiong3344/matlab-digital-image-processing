%����ͼƬ
img = imread('office.png');
img = rgb2gray(img);
figure(1);
subplot(2, 1, 1);
imshow(img);
title('Raw Image');
gamma_H = 2;
gamma_L = 0.25;
c = 0.25;
D0 =100;
f = double(img);
f = log(f + 1);%ȡָ��
F = fft2(f);%����Ҷ�任
F=fftshift(F);%Ƶ�װ���
[height, width] = size(F);
%���һ��̬ͬ�˲���
H = HomomorphicFiltering(gamma_H, gamma_L, c, D0, height, width);
g=H.*F;%̬ͬ�˲�
g = ifft2(ifftshift(g));%Ƶ�װ���,����Ҷ��任
g = exp(g)-1;
g = real(g);
%��������ֵ
new_img = Expand(g);
subplot(2,1,2);
imshow(new_img);
title('Homomorphic Filtered Image(D0 = 100)');



function new_img = Expand( img ) 
    [height, width] = size(img);
    max_pixel = max(max(img));
    min_pixel = min(min(img));
    new_img=zeros(height,width);
    for i = 1 : height
        for j = 1 : width
            new_img(i, j) = 255 * (img(i, j) - min_pixel) / (max_pixel - min_pixel);
        end
    end
    new_img = uint8(new_img);
end


function H = HomomorphicFiltering( gamma_H, gamma_L, c, D0, height, width )
    for i = 1 : height
        x = i - (height / 2);
        for j = 1 : width
            y = j - (width / 2);
            H(i, j) = (gamma_H - gamma_L) * (1 - exp(-c * ((x ^ 2 + y ^ 2) / D0 ^ 2))) + gamma_L;
        end
    end
end




