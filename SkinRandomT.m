first=3601; %Starting seconds (after first hour)
last=7200; %end of second hour
lag = 5; %Optimal lag from the scatters plotted

    for i=1:40 %Go through all 40 participants

    Data=readmatrix(['C' num2str(i) '.txt']);
    
    T=Data(first:last,2); % Skin temp
    S=Data(first:last,3); % SpO2
    H=Data(first:last,4); % Heart rate
    R=Data(first:last,5); % Resp rate 

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
    results(i, :) = [TEa, TEb, TEc, TEd, TEe, TEf, TEg, TEh, TEi, TEj, TEk, TEl];
    
    end

TEo = transferEntropyPartition(T, S, lag, lag); %Original TE0 

repeat = 100; %The number of MonteCarlo Simulations

distributionplot= NaN(100,1); %An empty colum that can fill upto 100 TE values.



for i = 1:repeat %Repeat 100 times
    TS = T(randperm(length(T))); %Randomly shuffle all the Temperature values
    TE = transferEntropyPartition(TS, S, 5, 5); %Calulate the new TE
    distributionplot(i,1)= TE; %Store the TE into the empty matrix, which eventual becomes filled.
    
end

x = sort(distributionplot); %Store distribution matrix in variable 'x'

Significance = x(95,1);

Differencevalue= TEo - Significance
Significancetest= TEo > Significance

