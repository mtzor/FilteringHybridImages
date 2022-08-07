clear all;
close all;
clc;
%HIGHPASS

 I = im2single(imread( 'fylla_gyrismenh.jpg' ));
 I=imresize(I,0.1);
 figure;
 imshow(I);

 
 A2 = fspecial('Gaussian', [25 1], 4);%creating gaussian filter to get blurred image
 blur_image = my_imfilter(I, A2);%applying filter to image
 blur_image = my_imfilter(blur_image, A2'); %applying the transpose filter to the image 
 
 I1_highpass = I- blur_image;%subtracting the low frequency coefficients (texture) 
                            %of the image to get the high frequence ones (edges)
 figure;
 imshow(I1_highpass+0.5);%showing high frequency coefficients
 %adding 0.5 to get rid of the negative values of the image and visualise it properly

 
 %LOWPASS 
    I = im2single(imread( 'fylla.jpg' ));
    I=imresize(I,0.1);
    figure;
    imshow(I);
 
    %HIGH BLUR
    A2 = fspecial('Gaussian', [25 1], 4);%creating gaussian filter to get blurred image
    I2_lowpass = my_imfilter(I, A2);%applying filter to image
    I2_lowpass = my_imfilter(I2_lowpass, A2'); %applying the transpose filter to the image
    figure;
    imshow(I2_lowpass);%showing low frequency coefficients



%add the images 
imfinal=I1_highpass+I2_lowpass; % creating hybrid image
figure;
imshow(imfinal);


output = visualize_hybrid_image(imfinal);%using given function to simulate the change of perception of the image
%depending on the distance of the viewer from the image
figure;
imshow(output);


