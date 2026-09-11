laggraph=NaN(7,12);

laggraph(1,:)= readmatrix( "Lagtimematrices/healthymedian1.txt");
laggraph(2,:)= readmatrix( "Lagtimematrices/healthymedian5.txt");
laggraph(3,:)= readmatrix( "Lagtimematrices/healthymedian10.txt");
laggraph(4,:)= readmatrix( "Lagtimematrices/healthymedian15.txt");
laggraph(5,:)= readmatrix( "Lagtimematrices/healthymedian20.txt");
laggraph(6,:)= readmatrix( "Lagtimematrices/healthymedian25.txt");
laggraph(7,:)= readmatrix( "Lagtimematrices/healthymedian30.txt");

standarderrorlag=NaN(7,12);

lagone = readmatrix("/Users/sfountzopoulos/Library/CloudStorage/OneDrive-Personal/Research/NetworkPhysiology/MATLABTe/Lagtimematrices/healthyresults_lag1.txt");

standarderrorlag(1,1)= std(lagone(:,1)) / sqrt(24);
standarderrorlag(1,2)= std(lagone(:,2)) / sqrt(24);
standarderrorlag(1,3)= std(lagone(:,3)) / sqrt(24);
standarderrorlag(1,4)= std(lagone(:,4)) / sqrt(24);
standarderrorlag(1,5)= std(lagone(:,5)) / sqrt(24);
standarderrorlag(1,6)= std(lagone(:,6)) / sqrt(24);
standarderrorlag(1,7)= std(lagone(:,7)) / sqrt(24);
standarderrorlag(1,8)= std(lagone(:,8)) / sqrt(24);
standarderrorlag(1,9)= std(lagone(:,9)) / sqrt(24);
standarderrorlag(1,10)= std(lagone(:,10)) / sqrt(24);
standarderrorlag(1,11)= std(lagone(:,11)) / sqrt(24);
standarderrorlag(1,12)= std(lagone(:,12)) / sqrt(24);

lagfive = readmatrix("/Users/sfountzopoulos/Library/CloudStorage/OneDrive-Personal/Research/NetworkPhysiology/MATLABTe/Lagtimematrices/healthyresults_lag5.txt");

standarderrorlag(2,1)= std(lagfive(:,1)) / sqrt(24);
standarderrorlag(2,2)= std(lagfive(:,2)) / sqrt(24);
standarderrorlag(2,3)= std(lagfive(:,3)) / sqrt(24);
standarderrorlag(2,4)= std(lagfive(:,4)) / sqrt(24);
standarderrorlag(2,5)= std(lagfive(:,5)) / sqrt(24);
standarderrorlag(2,6)= std(lagfive(:,6)) / sqrt(24);
standarderrorlag(2,7)= std(lagfive(:,7)) / sqrt(24);
standarderrorlag(2,8)= std(lagfive(:,8)) / sqrt(24);
standarderrorlag(2,9)= std(lagfive(:,9)) / sqrt(24);
standarderrorlag(2,10)= std(lagfive(:,10)) / sqrt(24);
standarderrorlag(2,11)= std(lagfive(:,11)) / sqrt(24);
standarderrorlag(2,12)= std(lagfive(:,12)) / sqrt(24);

lagten = readmatrix("/Users/sfountzopoulos/Library/CloudStorage/OneDrive-Personal/Research/NetworkPhysiology/MATLABTe/Lagtimematrices/healthyresults_lag10.txt");

standarderrorlag(3,1)= std(lagten(:,1)) / sqrt(24);
standarderrorlag(3,2)= std(lagten(:,2)) / sqrt(24);
standarderrorlag(3,3)= std(lagten(:,3)) / sqrt(24);
standarderrorlag(3,4)= std(lagten(:,4)) / sqrt(24);
standarderrorlag(3,5)= std(lagten(:,5)) / sqrt(24);
standarderrorlag(3,6)= std(lagten(:,6)) / sqrt(24);
standarderrorlag(3,7)= std(lagten(:,7)) / sqrt(24);
standarderrorlag(3,8)= std(lagten(:,8)) / sqrt(24);
standarderrorlag(3,9)= std(lagten(:,9)) / sqrt(24);
standarderrorlag(3,10)= std(lagten(:,10)) / sqrt(24);
standarderrorlag(3,11)= std(lagten(:,11)) / sqrt(24);
standarderrorlag(3,12)= std(lagten(:,12)) / sqrt(24);

lagfifteen = readmatrix("/Users/sfountzopoulos/Library/CloudStorage/OneDrive-Personal/Research/NetworkPhysiology/MATLABTe/Lagtimematrices/healthyresults_lag15.txt");

standarderrorlag(4,1)= std(lagfifteen(:,1)) / sqrt(24);
standarderrorlag(4,2)= std(lagfifteen(:,2)) / sqrt(24);
standarderrorlag(4,3)= std(lagfifteen(:,3)) / sqrt(24);
standarderrorlag(4,4)= std(lagfifteen(:,4)) / sqrt(24);
standarderrorlag(4,5)= std(lagfifteen(:,5)) / sqrt(24);
standarderrorlag(4,6)= std(lagfifteen(:,6)) / sqrt(24);
standarderrorlag(4,7)= std(lagfifteen(:,7)) / sqrt(24);
standarderrorlag(4,8)= std(lagfifteen(:,8)) / sqrt(24);
standarderrorlag(4,9)= std(lagfifteen(:,9)) / sqrt(24);
standarderrorlag(4,10)= std(lagfifteen(:,10)) / sqrt(24);
standarderrorlag(4,11)= std(lagfifteen(:,11)) / sqrt(24);
standarderrorlag(4,12)= std(lagfifteen(:,12)) / sqrt(24);


lagtwenty = readmatrix("/Users/sfountzopoulos/Library/CloudStorage/OneDrive-Personal/Research/NetworkPhysiology/MATLABTe/Lagtimematrices/healthyresults_lag20.txt");

standarderrorlag(5,1)= std(lagtwenty(:,1)) / sqrt(24);
standarderrorlag(5,2)= std(lagtwenty(:,2)) / sqrt(24);
standarderrorlag(5,3)= std(lagtwenty(:,3)) / sqrt(24);
standarderrorlag(5,4)= std(lagtwenty(:,4)) / sqrt(24);
standarderrorlag(5,5)= std(lagtwenty(:,5)) / sqrt(24);
standarderrorlag(5,6)= std(lagtwenty(:,6)) / sqrt(24);
standarderrorlag(5,7)= std(lagtwenty(:,7)) / sqrt(24);
standarderrorlag(5,8)= std(lagtwenty(:,8)) / sqrt(24);
standarderrorlag(5,9)= std(lagtwenty(:,9)) / sqrt(24);
standarderrorlag(5,10)= std(lagtwenty(:,10)) / sqrt(24);
standarderrorlag(5,11)= std(lagtwenty(:,11)) / sqrt(24);
standarderrorlag(5,12)= std(lagtwenty(:,12)) / sqrt(24);

lagtwentyfive = readmatrix("/Users/sfountzopoulos/Library/CloudStorage/OneDrive-Personal/Research/NetworkPhysiology/MATLABTe/Lagtimematrices/healthyresults_lag25.txt");

standarderrorlag(6,1)= std(lagtwentyfive(:,1)) / sqrt(24);
standarderrorlag(6,2)= std(lagtwentyfive(:,2)) / sqrt(24);
standarderrorlag(6,3)= std(lagtwentyfive(:,3)) / sqrt(24);
standarderrorlag(6,4)= std(lagtwentyfive(:,4)) / sqrt(24);
standarderrorlag(6,5)= std(lagtwentyfive(:,5)) / sqrt(24);
standarderrorlag(6,6)= std(lagtwentyfive(:,6)) / sqrt(24);
standarderrorlag(6,7)= std(lagtwentyfive(:,7)) / sqrt(24);
standarderrorlag(6,8)= std(lagtwentyfive(:,8)) / sqrt(24);
standarderrorlag(6,9)= std(lagtwentyfive(:,9)) / sqrt(24);
standarderrorlag(6,10)= std(lagtwentyfive(:,10)) / sqrt(24);
standarderrorlag(6,11)= std(lagtwentyfive(:,11)) / sqrt(24);
standarderrorlag(6,12)= std(lagtwentyfive(:,12)) / sqrt(24);

lagthirty = readmatrix("/Users/sfountzopoulos/Library/CloudStorage/OneDrive-Personal/Research/NetworkPhysiology/MATLABTe/Lagtimematrices/healthyresults_lag30.txt");

standarderrorlag(7,1)= std(lagthirty(:,1)) / sqrt(24);
standarderrorlag(7,2)= std(lagthirty(:,2)) / sqrt(24);
standarderrorlag(7,3)= std(lagthirty(:,3)) / sqrt(24);
standarderrorlag(7,4)= std(lagthirty(:,4)) / sqrt(24);
standarderrorlag(7,5)= std(lagthirty(:,5)) / sqrt(24);
standarderrorlag(7,6)= std(lagthirty(:,6)) / sqrt(24);
standarderrorlag(7,7)= std(lagthirty(:,7)) / sqrt(24);
standarderrorlag(7,8)= std(lagthirty(:,8)) / sqrt(24);
standarderrorlag(7,9)= std(lagthirty(:,9)) / sqrt(24);
standarderrorlag(7,10)= std(lagthirty(:,10)) / sqrt(24);
standarderrorlag(7,11)= std(lagthirty(:,11)) / sqrt(24);
standarderrorlag(7,12)= std(lagthirty(:,12)) / sqrt(24);



xvalues = [1 5 10 15 20 25 30]; % Lag values

titles = {
    'Temp \rightarrow SpO_2'
    'SpO_2 \rightarrow Temp'
    'Temp \rightarrow Heart rate'
    'Heart rate \rightarrow Temp'
    'Temp \rightarrow Respiratory rate'
    'Respiratory rate \rightarrow Temp'
    'SpO_2 \rightarrow Heart rate'
    'Heart rate \rightarrow SpO_2'
    'SpO_2 \rightarrow Respiratory rate'
    'Respiratory rate \rightarrow SpO_2'
    'Heart rate \rightarrow Respiratory rate'
    'Respiratory rate \rightarrow Heart rate'
};

figure
t = tiledlayout(3,4,'Padding','compact','TileSpacing','compact');

for lagtime = 1:12
    yvalues = laggraph(:,lagtime);          
    semvalues = standarderrorlag(:,lagtime);

    nexttile
    hold on
    errorbar(xvalues, yvalues, semvalues, 'LineStyle','none')
    scatter(xvalues, yvalues, 'filled')
    title(titles{lagtime}, 'FontSize', 10)
    set(gca, 'FontSize', 8)
    hold off
end

xlabel(t, 'Time lag (sec)', 'FontSize', 12)
ylabel(t, 'Transfer entropy', 'FontSize', 12)

saveas(gcf, 'timelag_on_transferE_all12.fig')