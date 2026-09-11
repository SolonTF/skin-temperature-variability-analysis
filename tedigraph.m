% code to plot TE network 

clc
close all
clear all

first=3601; % start from 3601 second (ignoring the first hour)
last=7200; % end at second hour so total duration of our time sereis is 1 hour

load("Data.mat")

lag = 30; % based previous optimisations 


    for i=1:24

    Participant=Data{i};
    
    T=Participant(first:last,2); % Skin temp
    S=Participant(first:last,3); % SpO2
    H=Participant(first:last,4); % Heart rate
    R=Participant(first:last,5); % Resp rate 

    TEa = transferEntropyPartition(T,S,lag,lag);
    TEb = transferEntropyPartition(S,T,lag,lag);
    TEc = transferEntropyPartition(T,H,lag,lag);
    TEd = transferEntropyPartition(H,T,lag,lag);
    TEe = transferEntropyPartition(T,R,lag,lag);
    TEf = transferEntropyPartition(R,T,lag,lag);
    TEg = transferEntropyPartition(S,H,lag,lag);
    TEh = transferEntropyPartition(H,S,lag,lag);
    TEi = transferEntropyPartition(S,R,lag,lag);
    TEj = transferEntropyPartition(R,S,lag,lag);
    TEk = transferEntropyPartition(H,R,lag,lag);
    TEl = transferEntropyPartition(R,H,lag,lag);

% Store the results in a matrix for later analysis
    healthyresults(i, :) = [TEa, TEb, TEc, TEd, TEe, TEf, TEg, TEh, TEi, TEj, TEk, TEl];
    
    end

healthyresults;

a=median(healthyresults);

% structure of adjacency matrix
%%%T S H R
%T
%S
%H
%R

b=NaN(4,4);
b(1,1)= 0;
b(1,2)= a(1,1);
b(1,3)= a(1,3);
b(1,4)= a(1,5);
b(2,1)= a(1,2);
b(2,2)= 0;
b(2,3)= a(1,7);
b(2,4)= a(1,9);
b(3,1)= a(1,4);
b(3,2)= a(1,8);
b(3,3)= 0;
b(3,4)= a(1,11);
b(4,1)= a(1,6);
b(4,2)= a(1,10);
b(4,3)= a(1,12);
b(4,4)= 0;

G=digraph(b);

LWidths = 5*G.Edges.Weight/max(G.Edges.Weight);
nLabels = {'Skin Temperature','SpO2','Heart rate','Respiratory rate'};
h=plot(G,'Layout','force','EdgeLabel',G.Edges.Weight,'LineWidth',LWidths, 'NodeLabel',nLabels)
axis square
h.ArrowSize = 20
