%��˹��ͨ
I=imread('aaa.tif');
figure(2);
subplot(221),imshow(I);
title('ԭͼ��');
Y=fft2(im2double(I));%����Ҷ�任
Y=fftshift(Y);%Ƶ�װ���,ֱ���������Ƶ�Ƶ������
subplot(222), imshow(log(abs(Y)+1),[]); 
title('ͼ����Ҷ�任ȡ��������Ƶ��');
[M,N]=size(Y);%���ͼ��ĸ߶ȺͿ��
h=zeros(M,N);%�˲�������
%ͼ�����ĵ�
M0=M/2;
N0=N/2;
%����Ƶ�ʾ���Բ��ľ��룬delta��ʾ��˹���ߵ���ɢ�̶�
D0=40;
delta=D0;
for x=1:M
    for y=1:N
        %����㣨x,y�������ĵ�ľ���
        d2=(x-M0)^2+(y-N0)^2;
        %�����˹�˲���
        h(x,y)=1-exp(-d2/(2*delta^2));
    end
end
%�˲�����
res=h.*Y;
res=real(ifft2(ifftshift(res)));
subplot(223),imshow(res);
title('��˹��ͨ�˲�����ͼ��'); 
subplot(224),imshow(h);
title("��˹��ͨ�˲���ͼ��");