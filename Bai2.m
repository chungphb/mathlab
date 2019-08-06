file2 = fopen('Bai2.txt', 'wt');
file1 = fopen('Bai1.txt', 'r');
i = 0;
while ~feof(file1) 
    if i==0 
        str = fgetl(file1);
        fprintf(file2, '%s\n', '#Sau khi sap xep theo tung dong');
        i = i + 1;
    elseif i==1
        str = fgetl(file1);
        fprintf(file2,'\n');
        i = i + 1;
    else
        str = fgetl(file1);
        d = sscanf(str, '%d', inf);
        i = i + 1;
        for j = 2:(length(d) - 1)
            for k = (j + 1):length(d)
                if d(j) > d(k)
                    tmp = d(j);
                    d(j) = d(k);
                    d(k) = tmp;
                end
            end
        end
        for i = 1:length(d)
            fprintf(file2, '%d ', d(i));
        end
        fprintf(file2, '\n');
    end
end
fclose(file1);
fclose(file2);
