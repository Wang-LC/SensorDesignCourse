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
%subplot(2,2,1)
figure
pcolor(temp); axis square
%title( ['Frame: ', num2str(frame), '. At ', num2str(time), ' s'] )
colorbar

%% Average out all frames
time_ave = data(50, 1);
for p = 0:16
    temp_ave(p+1,:) = sum(data((1+50*p):50+50*p, 2:end))./50;
end
%subplot(2,2,2)
figure
pcolor(temp_ave); axis square
%title(['Average out all 50 frames. ', 'In ', num2str(time_ave), ' s'])
colorbar

%% filter
filter = 41.3;
temp_ave(temp_ave<filter)=0;
temp_ave(temp_ave>=filter)=1;
%subplot(2,2,4)
figure
pcolor(temp_ave); axis square
%title('Filter')
%colorbar
n=sum(sum(temp_ave))/numel(temp_ave);