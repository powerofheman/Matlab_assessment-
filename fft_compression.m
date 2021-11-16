clear all;
close all;
clc;

%A=imread('C:\Users\Heman\Downloads\image3_colour.jpeg');
A=imread('C:\Users\Heman\Downloads\zebra.jfif');
B=rgb2gray(A);
figure
imagesc(256-A)

%% 

Bt=fft2(B);
flow= log (abs(fftshift(Bt))+1);
imshow(256-mat2gray(flow),[]);

%% 

Btsort=sort(abs(Bt(:)));
counter =1;
for keep=[0.99 0.05 0.01 0.002];
    subplot(2,2,counter)
    thresh=Btsort(floor((1-keep)*length(Btsort)));
    ind=abs(Bt)>thresh;
    Atlow=Bt.*ind;
    Alow=uint8(ifft2(Atlow));
    imshow(256-Alow)
    title(['',num2str(keep*100),'%'],'FontSize',36)
    counter = counter + 1;
end
