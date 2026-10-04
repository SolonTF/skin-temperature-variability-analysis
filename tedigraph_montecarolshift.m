   % code to plot TE network 

clc
close all
clear all

first=3601; % start from 3601 second (ignoring the first hour)
last=7200; % end at second hour so total duration of our time sereis is 1 hour

lag = 30; % based previous optimisations 

load('Data.mat')

    for i=1:24

    participant=Data{i};
    
    T=participant(first:last,2); % Skin temp
    S=participant(first:last,3); % SpO2
    H=participant(first:last,4); % Heart rate
    R=participant(first:last,5); % Resp rate 

    TEadiff = TEAlireza3(T,S,lag,lag)
    TEbdiff = TEAlireza3(S,T,lag,lag)
    TEcdiff = TEAlireza3(T,H,lag,lag)
    TEddiff = TEAlireza3(H,T,lag,lag)
    TEediff = TEAlireza3(T,R,lag,lag)
    TEfdiff = TEAlireza3(R,T,lag,lag)
    TEgdiff = TEAlireza3(S,H,lag,lag)
    TEhdiff = TEAlireza3(H,S,lag,lag)
    TEidiff = TEAlireza3(S,R,lag,lag)
    TEjdiff = TEAlireza3(R,S,lag,lag)
    TEkdiff = TEAlireza3(H,R,lag,lag)
    TEldiff = TEAlireza3(R,H,lag,lag)

% Store the results in a matrix for later analysis
    resultsaftershift(i, :) = [TEadiff, TEbdiff, TEcdiff, TEddiff, TEediff, TEfdiff, TEgdiff, TEhdiff, TEidiff, TEjdiff, TEkdiff, TEldiff];
    
    end

resultsaftershift;

a=median(resultsaftershift);

% structure of adjacency matrix
%%%T S H R
%T
%S
%H
%R

baftershift=NaN(4,4);
baftershift(1,1)= 0;
baftershift(1,2)= a(1,1);
baftershift(1,3)= a(1,3);
baftershift(1,4)= a(1,5);
baftershift(2,1)= a(1,2);
baftershift(2,2)= 0;
baftershift(2,3)= a(1,7);
baftershift(2,4)= a(1,9);
baftershift(3,1)= a(1,4);
baftershift(3,2)= a(1,8);
baftershift(3,3)= 0;
baftershift(3,4)= a(1,11);
baftershift(4,1)= a(1,6);
baftershift(4,2)= a(1,10);
baftershift(4,3)= a(1,12);
baftershift(4,4)= 0;

Gdiff=digraph(baftershift);

LWidths = 5*Gdiff.Edges.Weight/max(Gdiff.Edges.Weight);
nLabels = {'Skin Temperature','SpO2','Heart rate','Respiratory rate'};
h=plot(Gdiff,'Layout','force','EdgeLabel',Gdiff.Edges.Weight,'LineWidth',LWidths, 'NodeLabel',nLabels)
axis square
h.ArrowSize = 20
