clear all;
close all;

%HIGHPASS LAPLACIAN
 I = im2single(imread('pair1_einstein.bmp'));

 figure;
 imshow(I);
 
 A1= [0 1 0; 1 -4 1; 0 1 0];%creating laplacian filter to get the high frequencie of the image
 I1_highpass = my_imfilter( I, A1 ); %applying filter to image
 figure;
 imshow(I1_highpass+0.5);%adding 0.5 to get rid of the negative values of the image and visualise it properly


%LOWPASS 

 I = im2single(imread('pair1_marilyn.bmp'));
 figure;
 imshow(I);
 
 %HIGH BLUR
 A2 = fspecial('Gaussian', [25 1], 10);%creating gaussian filter to get blurred image
 I2_lowpass = my_imfilter(I, A2);%applying filter to image
 I2_lowpass = my_imfilter(I2_lowpass, A2'); %applying the transpose filter to the image
 figure;
 imshow(I2_lowpass);
 % 



%add the images 
imfinal=I1_highpass+I2_lowpass;% creating hybrid image
figure;
imshow(imfinal);



output = visualize_hybrid_image(imfinal);%using given function to simulate the change of perception of the image
%depending on the distance of the viewer from the image
figure;
imshow(output);


