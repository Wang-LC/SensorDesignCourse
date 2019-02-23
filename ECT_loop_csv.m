clf
clear
close
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data = csvread('ECT_RES.csv'); % Read in csv file from ansys
I = ones(1, 9);
s = zeros(6, 9);
% Place data from csv file into s
for n =1:9
    s(:,n) = data((n*2+1),:)';
end
 
% Inverse derivation capacitor position
b = s' * s + 0.001 .* diag(I, 0);
d = inv(b);
p_cap = zeros(9, 9);
for n = 1:9
    p_cap(:, n) = d * s' * (s(:, n));
end
 
% Plot the position result
for n = 1:9
    z = [p_cap(1:3,n)';p_cap(4:6,n)';p_cap(7:9,n)'];
    subplot(3,3,n)
    imagesc(z)
end
     