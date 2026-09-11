%Coarse-graining method used in MSE (scaling) to observe how temperature dynamics change as you "zoom out" 
% (filtering out high-frequency noise)

% Define the scale factor for coarse-graining
clc
close all
clear all

first=3601; % start from 3601 second (ignoring the first hour)
last=7200; % end at second hour so total duration of our time sereis is 1 hour


   
load('Data.mat')

    participant=Data{2};
    
    Temp =participant(first:last,2); % Skin temp

  
  
for t = 2:5; %t for scale factor 



for j= 1:(length(Temp)/t) ; % Calculate the starting index for coarse-graining

i= (j-1)*t+1; %j is the initial point of each new block

 
 
 Tafterscaled(j,t)=sum(Temp(i:j*t,1))/ t; %divide by scale factor to find 
 % average

end

end

subplot(5,1,1)
plot(Temp)
title('Scale 1')

endpoint2(:,1) = find(Tafterscaled(:,2)); %to ensure time series all goes to
subplot(5,1,2)
plot(Tafterscaled(endpoint2,2))
title('Scale 2')

endpoint3(:,1) = find(Tafterscaled(:,3)); %to ensure time series all goes to
subplot(5,1,3)
plot(Tafterscaled(endpoint3,3))
title('Scale 3')

endpoint4(:,1) = find(Tafterscaled(:,4)); %to ensure time series all goes to
subplot(5,1,4)
plot(Tafterscaled(endpoint4,4))
title('Scale 4')

endpoint5(:,1) = find(Tafterscaled(:,5)); %to ensure time series all goes to
subplot(5,1,5)
plot(Tafterscaled(endpoint5,5))
title('Scale 5')


