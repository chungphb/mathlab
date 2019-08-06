file3 = fopen('Bai3.txt', 'r');
file4 = fopen('Bai4.txt', 'r');
file5 = fopen('Bai5.txt', 'wt');
i = 0;
while ~feof(file3)
    if i==0 
        str = fgetl(file3);
        fprintf(file5, '%s\n', '#Sau khi tron:');
        i = i + 1;
    elseif i==1
        str = fgetl(file3);
        fprintf(file5, '\n');
        i = i + 1;
    elseif i==2
        Aline = fgetl(file3);
        d = sscanf(Aline, '%d', inf);
        Mat = d';
        i = i + 1;
    else
        Aline = fgetl(file3);
        d = sscanf(Aline, '%d', inf);
        Mat = [Mat; d'];
        i = i + 1;
    end
end
i = 0;
while ~feof(file4)
    if i < 2 
        str = fgetl(file4);
        i = i + 1;
        continue
    else
        Aline = fgetl(file4);
        d = sscanf(Aline, '%d', inf);
        Mat = [Mat; d'];
        i = i + 1;
    end
end
x = size(Mat);
for i = x(2):-1:2
    for j = 1:(x(1)-1)
        for k = (j+1):x(1)
            if Mat(j,i) > Mat(k,i)
                tmp = Mat(j,:);
                Mat(j,:) = Mat(k,:);
                Mat(k,:) = tmp;
            end
            if i<x(2) & Mat(j,i) == Mat(k,i) & Mat(j,i+1)>Mat(k,i+1)
                tmp = Mat(j,:);
                Mat(j,:) = Mat(k,:);
                Mat(k,:) = tmp;
            end
        end
    end
end
for i = 1:x(1)
    for j = 1:x(2)
        fprintf(file5, '%d ', Mat(i,j));
    end
    fprintf(file5, '\n');
end
fclose(file3);
fclose(file4);
fclose(file5);