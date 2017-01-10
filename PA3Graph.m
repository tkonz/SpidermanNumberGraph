clc;
clear all;
close all;

fid = fopen('porgat.txt', 'r');

tline = fgetl(fid);
nChar = 6486;
nBook = 12942;

Char = textscan(fid, '%d %s', nChar, 'Delimiter', '\n');
Char = Char{2};

Book = textscan(fid, '%d %s', nBook, 'Delimiter', '\n');
Book = Book{2};

fgetl(fid) %skip *EdgesList

A = zeros(nChar,nBook);

while ~feof(fid)
   C = strsplit(fgetl(fid)); 
    for i = 2:length(C)
        row = str2num(C{1}); % character is always index 1
        col = str2num(C{i})-nChar;
        A(row, col) = 1; % bool is true
    end
end


% sqrMatrix * Identity is A^1 which represents first degree
sqrMatrix = A * A';
smn = zeros(nChar, 1);

% Spider Man is char number 5306
for i = 1:6486
    if sqrMatrix(i, 5306) ~= 0
        smn(i, 1) = 1;
    end
end

% sqrMatrix sqaured is A*A which represents second degree
smn2 = sqrMatrix * sqrMatrix;
for i = 1:6486
    if smn2(i, 5306) ~= 0
        if smn(i, 1) == 0
            smn(i, 1) = 2;
        end
    end
end

% sqrMatrix cubed is A*A*A which represents third degree
smn3 = sqrMatrix * sqrMatrix * sqrMatrix;
for i = 1:6486
    if smn3(i, 5306) ~= 0
        if smn(i, 1) == 0
            smn(i, 1) = 3;
        end
    end
end

numx0 = 0;
numx1 = 0;
numx2 = 0;
numx3 = 0;




for i = 1:6486
    if smn(i, 1) == 0
        numx0 = numx0 + 1;
    end
    if smn(i, 1) == 1
        numx1 = numx1 + 1;
    end
    if smn(i, 1) == 2
        numx2 = numx2 + 1;
    end
    if smn(i, 1) == 3
        numx3 = numx3 + 1;
    end
end

disp(numx0)
disp(numx1)
disp(numx2)
disp(numx3)

x = [0, 1, 2, 3];
y = [numx0, numx1, numx2, numx3];
bar(x,y)

for i = 1:6486/2
    fprintf('%s, %d\n', Char{i}, smn(i));
end
for i = 6486/2:6486
   fprintf('%s, %d\n', Char{i}, smn(i));
end