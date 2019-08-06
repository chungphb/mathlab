d = input('Nhap so dong: d = ')
c = input('Nhap so cot: c = ')
fd = fopen('Bai1.txt', 'wt');
fprintf(fd, '#Du lieu sinh ra ngau nhien\n');
fprintf(fd, '%d\n', d);
for i = 1:d
    fprintf(fd, '%d ', c);
    for j = 1:c 
        fprintf(fd, '%d ', randi(1000));
    end
    fprintf(fd, '\n');
end
fclose(fd);


