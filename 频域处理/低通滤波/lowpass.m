


% %�����ͨ
% I = imread('aaa.tif');
% figure(4);
% subplot(221),imshow(I);
% title('ԭͼ��');
% I=im2double(I);
% s=fftshift(fft2(I));%����Ҷ�任��ֱ���������Ƶ�Ƶ������
% subplot(222), imshow(log(abs(s)+1),[]); 
% title('ͼ����Ҷ�任ȡ��������Ƶ��');
% [a,b]=size(s);
% h=zeros(a,b);%�˲�������
% res=zeros(a,b);%������
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
% title('�����ͨ�˲�����ͼ��'); 
% subplot(224),imshow(h);
% title("�����ͨ�˲���ͼ��");