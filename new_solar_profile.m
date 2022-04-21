clc;
clear all;
close all;

% Loading daily solar patteren
fileID = fopen('two_day_daily_solar_sunny.txt','r');
formatSpec = '%f';
Solarshape = fscanf(fileID,formatSpec);

for i=1:2881
    if Solarshape(i,1)<0.01
        Solarshape1(i,1)=0;
    else
       Solarshape1(i,1)=Solarshape(i,1); 
    end
end
        