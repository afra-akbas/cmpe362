%%PROBLEM 1
figure(1); %plot problem 1 in a single figure window
t = (-2:0.01:2); %define t 
%define y values
y1 = sin(2*pi*t);
y2 = sin(2*pi*10*t);
y3 = 10*sin(2*pi*t);
y4 = sin(2*pi*t)+10;
y5 = sin(2*pi*(t-0.5));
y6 = 10*sin(2*pi*10*t);
y7 = t.*sin(2*pi*t);
y8 = sin(2*pi*t)./t;
y9 = y1+y2+y3+y4+y5+y6+y7+y8;
%plot t and all y values in subplots
subplot(5,2,1);plot(t);
subplot(5,2,2);plot(y1);
subplot(5,2,3);plot(y2);
subplot(5,2,4);plot(y3);
subplot(5,2,5);plot(y4);
subplot(5,2,6);plot(y5);
subplot(5,2,7);plot(y6);
subplot(5,2,8);plot(y7);
subplot(5,2,9);plot(y8);
subplot(5,2,10);plot(y9);

%%PROBLEM 2
figure(2); %plot the problem 2 in a different figure window
z = randn(401,1).*0.1; %create 401 random variables multiply with 0.1
%create y values
y10 = z;
y11 = z+t;
y12 = z+y1;
y13 = z.*y1;
y14 = t.*sin(2*pi*z);
y15 = sin(2*pi*(t+z));
y16 = z.*y2;
y17 = sin(2*pi*(t+10*z));
y18 = y1./z;
y19 = y11+y12+y13+y14+y15+y16+y17+y18;
%plot all y values in subplots
subplot(5,2,1);plot(y10);
subplot(5,2,2);plot(y11);
subplot(5,2,3);plot(y12);
subplot(5,2,4);plot(y13);
subplot(5,2,5);plot(y14);
subplot(5,2,6);plot(y15);
subplot(5,2,7);plot(y16);
subplot(5,2,8);plot(y17);
subplot(5,2,9);plot(y18);
subplot(5,2,10);plot(y19);

%%PROBLEM 3
figure(3); %plot the problem 3 in a different figure window
z = rand(401,1).*0.1; %create 401 random variables multiply with 0.1
%create y values
y20 = z;
y21 = z+t;
y22 = z+y1;
y23 = z.*y1;
y24 = t.*sin(2*pi*z);
y25 = sin(2*pi*(t+z));
y26 = z.*y2;
y27 = sin(2*pi*(t+10*z));
y28 = y1./z;
y29 = y21+y22+y23+y24+y25+y26+y27+y28;
%plot all y values in subplots
subplot(5,2,1);plot(y20);
subplot(5,2,2);plot(y21);
subplot(5,2,3);plot(y22);
subplot(5,2,4);plot(y23);
subplot(5,2,5);plot(y24);
subplot(5,2,6);plot(y25);
subplot(5,2,7);plot(y26);
subplot(5,2,8);plot(y27);
subplot(5,2,9);plot(y28);
subplot(5,2,10);plot(y29);

%%PROBLEM 4
figure(4);  %plot the problem 4 in a different figure window
r1 = normrnd(0,1,[5000,1]); % generate 5000 random variables with mean 0, variance 1
r2 = normrnd(0,sqrt(8),[5000,1]); % generate 5000 random variables with mean 0, variance 8;
r3 = normrnd(0,4,[5000,1]); % generate 5000 random variables with mean 0, variance 16;
r4 = normrnd(0,8,[5000,1]); % generate 5000 random variables with mean 0, variance 64;
%plot all r1-4 values in subplots
subplot(4,1,1);histogram(r1);
subplot(4,1,2);histogram(r2);
subplot(4,1,3);histogram(r3);
subplot(4,1,4);histogram(r4);

%%PROBLEM 5
figure(5); %plot the problem 5 in a different figure window
r6 = normrnd(10,1,[5000,1]); % generate 5000 random variables with mean 10, variance 1
r7 = normrnd(20,2,[5000,1]); % generate 5000 random variables with mean 20, variance 4
r8 = normrnd(-10,1,[5000,1]); % generate 5000 random variables with mean -10, variance 1
r9 = normrnd(-20,2,[5000,1]); % generate 5000 random variables with mean -20, variance 4
%plot all r6-9 values in subplots
subplot(4,1,1);histogram(r6);
subplot(4,1,2);histogram(r7);
subplot(4,1,3);histogram(r8);
subplot(4,1,4);histogram(r9);

%%Problem 6
figure(6); %plot the problem 6 in a different figure window
r11 = rand(5000,1)*8-4; % generate 5000 random variables with between -4 and 4
r21 = rand(5000,1)*40-20; % generate 5000 random variables with between -20 and 20;
%plot r11 and 21 values in subplots
subplot(2,1,1);histogram(r11);
subplot(2,1,2);histogram(r21);