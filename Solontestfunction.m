function [TEoutput]= Solontestfunction( X, Y, lag1,lag2)




 

TEo = transferEntropyPartition(X, Y, lag1, lag2); %Original TE0 

repeat = 100; %The number of MonteCarlo Simulations

distributionplot= NaN(100,1); %An empty colum that can fill upto 100 TE values.



for i = 1:repeat %Repeat 100 times
    XY = X(randperm(length(X))); %Randomly shuffle all the X values
    TE = transferEntropyPartition(XY, Y, lag1, lag2); %Calulate the new TE
    distributionplot(i,1)= TE; %Store the TE into the empty matrix, which eventual becomes filled.
    
end

x = sort(distributionplot); %Store distribution matrix in variable 'x'

Significance = x(95,1);

if TEo>Significance
    TEoutput = TEo;
else
    TEoutput = 0;
end

end

