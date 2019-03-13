clear
close
clc

%% Read in csv file
data = csvread('TG_data.csv',1,0);

%% Plot certain frame
frame = 1;
time = data(frame, 1);
for line = 1:17
    row = (50*(line-1))+frame; % 6, 56, 106, ..., 806 
    temp(line,:) = data(row, 2:end);
end
subplot(1,2,1)
pcolor(temp); axis square
title( ['Frame: ', num2str(frame), '. At ', num2str(time), ' s'] )
colorbar

%% Average out all frames
temp_all = zeros(17, 17);
time_all = data(50, 1);
for frame = 1:50
    for line = 1:17
        row = (50*(line-1))+frame; % 6, 56, 106, ..., 806 
        temp(line,:) = data(row, 2:end);
    end
    temp_all = temp_all + temp;
end
subplot(1,2,2)
pcolor(temp_all./50); axis square
title(['Average out all 50 frames. ', 'In ', num2str(time_all), ' s'])
colorbar
