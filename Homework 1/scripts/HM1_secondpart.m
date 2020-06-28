
%%PROBLEM 7
load('mysignal.mat'); % load the file
figure(1); 
n = length(x); % find the length of signal
S = fft(x); % apply Fourier transform
f = (0:n-1)*(fs/n); % frequency range
power = abs(S).^2/n; % power of signal
plot(f, power); % plot the power

figure(2); 
Y = fftshift(S); % shift zero-freq component
fshift = (-n/2:n/2-1)*(fs/n); % zero-centered frequency range
powerShift = abs(Y).^2/n; % zero-centered power
plot(fshift, powerShift); 

%%PROBLEM 9
x = imread('lena.png'); % read the image ‘lena.png’
x = rgb2gray(x); % convert the rgb image into a grayscale image
meanValue = mean(x(:)); % calculate the mean of the image
stdValue = std(double(x)); % calculate the standard deviation of the image
maxValue = max(x(:)); % find the max value of the image
minValue = min(x(:)); % find the min value of the image
[rowMax, colMax] = find(x == maxValue); %find the location of the max value
[rowMin, colMin] = find(x == minValue); % find the location of the min value
