function B = kwantyzacja(A, r, g, b)
[y,x,z] = size(A);
B = ones(y,x,z, 'uint8');

for i = 1:y
    for j = 1:x
        B(i,j,1) = uint8(floor(double(A(i,j,1))/(256/r)) * (256/r) + (256/r/2));
        B(i,j,2) = uint8(floor(double(A(i,j,2))/(256/g)) * (256/g) + (256/g/2));
        B(i,j,3) = uint8(floor(double(A(i,j,3))/(256/b)) * (256/b) + (256/b/2));
    end
end
end