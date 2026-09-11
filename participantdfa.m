%Using the dfa function, the dfa values and alpha values calculated for
%each participant

clc
close all
clear all

first=3601; % start from 3601 second (ignoring the first hour)
last=7200; % end at second hour so total duration of our time sereis is 1 hour

Slope_DFA=NaN(24,1);

load("Data.mat")

for i=1:24
    

    participant=Data{i};
    
    Temp =participant(first:last,2); % Skin temp
    
    [a,b]= dfa(Temp);

    participantdfas{i}(:,:)=[a,b];

    subplot(5,8,i)
    plot(a,b,'.')
    title(['Participant' num2str(i)])
    xlabel('log(n)')
    ylabel('log(F(n))')

A=a(12:end,1); % to look at log(n) of higher than 1.17
B=b(12:end,1);
S=[ones(length(A),1) A] \ B; % to calculate the slope

Slope_DFA(i,1)=S(2);

end

