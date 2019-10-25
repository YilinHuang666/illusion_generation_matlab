%function Audio_generate_script(n,sec) %n is the nth key you want to play, sec is the time in second you want to play
clear all
fs = 44100; % sampling frequency
amp=10;  % amplitude of the sound
num = 11; %number of tones generated
cons = nthroot(2,12);
sec = 3; % sec is number of seconds you want to play for each tone
duration=8000*sec/fs;
t=0:1/fs:duration;
feq_do = (cons)^(40-49)*440;  % frequency of the do
feq_re = (cons)^(42-49)*440;
feq_mi = (cons)^(44-49)*440;
feq_fa = (cons)^(45-49)*440;
feq_so = (cons)^(47-49)*440;
feq_la = (cons)^(49-49)*440;
feq_xi = (cons)^(51-49)*440;
feq_hdo = (cons)^(52-49)*440;
up_feq = 1:1:24001;
do=amp*sin(2*pi*feq_do*t);
re=amp*sin(2*pi*feq_re*t);
mi=amp*sin(2*pi*feq_mi*t);
fa=amp*sin(2*pi*feq_fa*t);
so=amp*sin(2*pi*feq_so*t);
la=amp*sin(2*pi*feq_la*t);
xi=amp*sin(2*pi*feq_xi*t);
hdo=amp*sin(2*pi*feq_hdo*t);
up_swip=amp*sin(2*pi*up_feq.*t);
[row, col] = size(t); % obtain the total number of elements in t; row always equals to 1 in this case. We just need the col number.
silent = zeros(1,col*num); %used for silent one channel
right=[hdo re la fa fa la re hdo];% by convention, left channel is first column, right channel is second column
left=[do xi mi so so mi xi do];
right = [right right right silent silent silent right right right right right right];
left = [left left left left left left silent silent silent left left left]; % repeat 3 times
scale_illusion = [left(:),right(:)];
%sound(scale_illusion,fs);
sound(up_swip);
audiowrite('scale_illusion.wav',scale_illusion,fs)
%end