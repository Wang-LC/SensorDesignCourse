clear
close
clc

data = csvread('TG_data.csv',1,1);
temp = zeros(17, 17);

for i = 0:16
	row = (50*i)+6; % 6, 56, 106, ..., 806 
    temp(i+1,:) = data(row, :);
end
pcolor(temp); axis square
