function output = my_conv(I, A)
    [a,b] = size(A);
    ah = floor(a/2);
    bh = floor(b/2);
    [m,n] = size(I);
    output = zeros(m,n);
    Im = padarray(I,[ah bh]);
    for i=1:m
        for j=1:n
            temp = Im(i:i+a-1 , j:j+b-1);
            temp = double(temp);
            conv = temp.*A;
            output(i,j) = sum(conv(:));
        end
    end
end