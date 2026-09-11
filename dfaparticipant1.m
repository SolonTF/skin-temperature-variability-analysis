clc
close all
clear all

first = 3601; % start from 3601 second, ignoring first hour
last = 7200;  % end at second hour, total duration = 1 hour

load("Data.mat")

i = 1; % representative participant

participant = Data{i};
Temp = participant(first:last,2); % Skin temperature

[a,b] = dfa(Temp);

% Fit post-crossover region only
A = a(12:end,1);
B = b(12:end,1);

% Linear regression: B = intercept + slope*A
S = [ones(length(A),1) A] \ B;

intercept = S(1);
slope = S(2);

B_fit = intercept + slope*A;

% Colour settings
blueColour = [0 0.4470 0.7410]; % MATLAB default blue
blackColour = [0 0 0];

figure

% Plot DFA points as blue dots
plot(a,b,'.','Color',blueColour,'MarkerSize',14)
hold on

% Plot line of best fit in red
plot(A,B_fit,'r-','LineWidth',2)

% Labels and title in black
xlabel('log(n)','Color',blackColour)
ylabel('log(F(n))','Color',blackColour)
title(['Participant ' num2str(i)],'Color',blackColour)

% Optional slope label inside the graph in black
text(min(A)+0.1, max(B_fit)-0.2, ...
    ['DFA slope = ' num2str(slope,'%.2f')], ...
    'Color',blackColour, ...
    'FontSize',12)

% Figure style
set(gcf,'Color','w')
set(gca,'Color','w')

% Axis lines and tick labels in black
set(gca,'XColor',blackColour)
set(gca,'YColor',blackColour)
set(gca,'FontSize',12)
set(gca,'LineWidth',1)

box on
hold off