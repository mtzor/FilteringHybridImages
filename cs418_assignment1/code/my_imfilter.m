function filteredImage = my_imfilter(I, A)%the function implemented to filter our image
%supports grayscale and rgb images

    if  size(I,3)==3%if image is rgb we anylise it into its three colors
        palette = 3;
        
        redChannel = I(:, :, 1);
        greenChannel = I(:, :, 2);
        blueChannel = I(:, :, 3);
        
        edRedChannel = my_conv(double(redChannel), A);%we convolve each color
        edGreenChannel = my_conv(double(greenChannel), A);
        edBlueChannel = my_conv(double(blueChannel), A);

        output(:, :, 1) = edRedChannel;%%we combine the colors again to make the output
        output(:, :, 2) = edGreenChannel;
        output(:, :, 3) = edBlueChannel;
        
        filteredImage = output;
    else
        palette = 1;%simple convolution for grayscale images
        filteredImage =  my_conv(double(I), A);
    end

   