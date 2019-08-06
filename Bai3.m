file3 = fopen('Bai3.txt', 'wt');
file1 = fopen('Bai1.txt', 'r');
i = 0;
while ~feof(file1)
    if i==0 
        str = fgetl(file1);
        fprintf(file3, '%s\n', '#Sau khi sap xep ca ma tran:');
        i = i + 1;
    elseif i==1
        str = fgetl(file1);
        fprintf(file3, '\n');
        i = i + 1;
    elseif i==2
        Aline = fgetl(file1);
        d = sscanf(Aline, '%d', inf);
        Mat = d';
        i = i + 1;
    else
        Aline = fgetl(file1);
        d = sscanf(Aline, '%d', inf);
        Mat = [Mat; d'];
        i = i + 1;
    end
end
x = size(Mat);
for i = 1:x(1)
    for j = 2:(x(2)-1)
        for k = (j+1):x(2)
            if Mat(i,j) > Mat(i,k)
                tmp = Mat(i,j);
                Mat(i,j) = Mat(i,k);
                Mat(i,k) = tmp;
            end
        end
    end
end
for i = x(2):-1:2
    for j = 1:(x(1)-1)
        for k = (j+1):x(1)
            if Mat(j,i) > Mat(k,i)
                tmp = Mat(j,:);
                Mat(j,:) = Mat(k,:);
                Mat(k,:) = tmp;
            end
            if i < x(2) & Mat(j,i)==Mat(k,i) & Mat(j,i+1)>Mat(k,i+1)
                tmp = Mat(j,:);
                Mat(j,:) = Mat(k,:);
                Mat(k,:) = tmp;
            end
        end
    end
end
for i = 1:x(1)
    for j = 1:x(2)
        fprintf(file3, '%d ', Mat(i,j));
    end
    fprintf(file3, '\n');
end
fclose(file1);
fclose(file3);
