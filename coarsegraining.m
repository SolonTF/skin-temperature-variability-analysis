%Coarse-graining method used in MSE (scaling) to observe how temperature dynamics change as you "zoom out" 
% (filtering out high-frequency noise)

% Define the scale factor for coarse-graining
clc
close all
clear all

first=3601; % start from 3601 second (ignoring the first hour)
last=7200; % end at second hour so total duration of our time sereis is 1 hour

load('Data.mat')


for t = 1:30 %t for scale factor 


    for i=1:24
    

    participant=Data{i};
    
    Temp =participant(first:last,2); % Skin temp



    numberOfAverages = floor(length(Temp)/t);

% Reset the coarse-grained temperature series for each scale and participant
    Tafterscaled = NaN(1, numberOfAverages);





        for j= 1:(length(Temp)/t)  % Calculate the starting index for coarse-graining

        initial= (j-1)*t+1; %j is the initial point of each new block

 
        Tafterscaled(:,j) = sum(Temp(initial:j*t,1))/t; %divide by scale factor to find 
         % average

        
         
        end
        
         SolonSampenvaluesparticipants{t}(i,:)= SolonSampen(Tafterscaled); %sample entropy

    end

    SolonSampenvalues(:,t) = mean(SolonSampenvaluesparticipants{t}(:,1));

    SEMmatrix(:,t)= std(SolonSampenvaluesparticipants{t}(:,1)) / sqrt(24);

    
end



% plot mean sample entropy across scales with SEM and add a reference line through (horizontal)
figure;
plot(1:30, SolonSampenvalues, '-o', 'LineWidth', 1.5, 'MarkerFaceColor', [0 0.45 0.74], 'MarkerEdgeColor', 'k', 'MarkerSize', 6);
hold on;
h = errorbar(1:30, SolonSampenvalues, SEMmatrix, 'LineStyle', 'none', 'Color', [0.85 0.33 0.10], 'LineWidth', 1.5);
% make error bar caps thicker and more visible
set(h, 'CapSize', 10);
hold off;
xlabel('Scale factor');
ylabel('Sample entropy');
title('Sample entropies from scale 1-30');
legend('Mean sample entropy','SEM','Location','best');
grid on;

