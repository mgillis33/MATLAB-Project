%% Intializing Variables, datasets, etc.
clear
close all
%Load the data into the workspace
traffic = readmatrix("trafficData.csv");
traffic2 = readmatrix("trafficDataComposite.csv");

%% Plot Each Approach vs. Time, and give the summary stats for each approach

%Initialize x as a 1x44 categorical vector with all of the time stamps in
%the correct order.
x = ["7:00","7:15","7:30","7:45","8:00","8:15","8:30","8:45","9:00","9:15","9:30","9:45","10:00","10:15","10:30","10:45","11:00","11:15","11:30","11:45","12:00","12:15","12:30","12:45","13:00","13:15","13:30","13:45","14:00","14:15","14:30","15:45","16:00","16:15","16:30","16:45","17:00","17:15","17:30","17:45","18:00","18:15","18:30","18:45"];
x = categorical(x);
x = reordercats(x,["7:00","7:15","7:30","7:45","8:00","8:15","8:30","8:45","9:00","9:15","9:30","9:45","10:00","10:15","10:30","10:45","11:00","11:15","11:30","11:45","12:00","12:15","12:30","12:45","13:00","13:15","13:30","13:45","14:00","14:15","14:30","15:45","16:00","16:15","16:30","16:45","17:00","17:15","17:30","17:45","18:00","18:15","18:30","18:45"])';

%Plotting the Distributions of the vehicles and pedestrians that pass
%through each street, as well as listing the summary stats for each
%approach

%Approach One: Saratoga Street West

    %Vehicles

        %Plot
        OneVehicles = traffic(3:end,2);
        figure
        bar(x,OneVehicles)
        title("Saratoga Street West Vehicles")
        xlabel("Time")
        ylabel("Vehicles Through Intersection")

        %Summary Stats
        OneVehiclesCenter = median(traffic(3:end,2));
        OneVehiclesSpread = iqr(traffic(3:end,2));
    
    %Pedestrians
    
        %Plot
        OnePedestrians = traffic(3:end,3);
        figure
        bar(x,OnePedestrians)
        title("Saratoga Street West Pedestrians")
        xlabel("Time")
        ylabel("Pedestrians Through Intersection")

        %Summary Stats
        OnePedeestriansCenter = median(traffic(3:end,3));
        OnePedestriansSpread = iqr(traffic(3:end,3));

%Approach Two: Bennington Street North

    %Vehicles
        
        %Plot
        TwoVehicles = traffic(3:end,4);
        figure
        bar(x,TwoVehicles)
        title("Bennington Street North Vehicles")
        xlabel("Time")
        ylabel("Vehicles Through Intersection")

        %Summary Stats
        TwoVehiclesCenter = median(traffic(3:end,4));
        TwoVehiclesSpread = iqr(traffic(3:end,4));

    %Pedestrians

        %Plot
        TwoPedestrians = traffic(3:end,5);
        figure
        bar(x,TwoPedestrians)
        title("Bennington Street North Pedestrians")
        xlabel("Time")
        ylabel("Pedestrians Through Intersection")

        %Summary Stats
        TwoPedestriansCenter = median(traffic(3:end,5));
        TwoPedestriansSpread = iqr(traffic(3:end,5));

%Approach Three: Saratoga Street East

    %Vehicles
        
        %Plot
        ThreeVehicles = traffic(3:end,6);
        figure
        bar(x,ThreeVehicles)
        title("Saratoga Street East Vehicles")
        xlabel("Time")
        ylabel("Vehicles Through Intersection")

        %Summary Stats
        ThreeVehiclesCenter = median(traffic(3:end,6));
        ThreeVehiclesSpread = iqr(traffic(3:end,6));
    
    %Pedestrians

        %Plot
        ThreePedestrians = traffic(3:end,7);
        figure
        bar(x,ThreePedestrians)
        title("Saratoga Street East Pedestrians")
        xlabel("Time")
        ylabel("Pedestrians Through Intersection")

        %Summary Stats
        ThreePedestriansCenter = median(traffic(3:end,7));
        ThreePedestriansSpread = iqr(traffic(3:end,7));

%Approach Four: Bennington Street South

    %Vehicles

        %Plot
        FourVehicles = traffic(3:end,8);
        figure
        bar(x,FourVehicles)
        title("Bennington Street South Vehicles")
        xlabel("Time")
        ylabel("Vehicles Through Intersection")

        %Summary Stats
        FourVehiclesCenter = median(traffic(3:end,8));
        FourVehiclesSpread = iqr(traffic(3:end,8));
    
    %Pedestrians

        %Plot
        FourPedestrians = traffic(3:end,9);
        figure
        bar(x,FourPedestrians)
        title("Bennington Street South Pedestrians")
        xlabel("Time")
        ylabel("Pedestrians Through Intersection")

        %Summary Stats
        FourPedestriansCenter = median(traffic(3:end,9));
        FourPedestriansSpread = iqr(traffic(3:end,9));

%% Hypothesis Test for Vehicles vs. Pedestrians  

%Run a linear regression model on Vehicles ~ Pedestrians
x1 = traffic2(:,3);
y1 = traffic2(:,2);
VehiclesVsPedestrians = fitlm(x1,y1);
figure
plot(VehiclesVsPedestrians)

%Confidence Interval for Slope of the Regression Model:
CI = coefCI(VehiclesVsPedestrians);

%Plot the Residuals
figure
plotResiduals(VehiclesVsPedestrians,'fitted');figure(gcf)
display(CI)
display(VehiclesVsPedestrians)