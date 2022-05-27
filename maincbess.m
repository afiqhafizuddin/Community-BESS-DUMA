clc
clear all   
close all;

% Loading daily load pattern
fileID = fopen('two_day_daily_load.txt','r');
formatSpec = '%f';
Loadshape_data = fscanf(fileID, formatSpec);
LS = length(Loadshape_data);

% Loading daily solar pattern
fileID = fopen('two_day_daily_solar_sunny.txt', 'r');
formatSpec = '%f';
Solarshape = fscanf(fileID, formatSpec);

% variables  declaration
R_charge = zeros(LS,1)
CHA_start=zeros(LS,1);
CHA_stop=zeros(LS,1);
DISCHA_start=zeros(LS,1); 
DISCHA_stop=zeros(LS,1);

% Activating the OpenDSS Simulation Platform

DSSObj = actxserver('OpenDSSEngine.DSS');
Start = DSSObj.Start(0);
DSSText = DSSObj.Text;
DSSCircuit=DSSObj.ActiveCircuit;
DSSSolution=DSSCircuit.Solution;
DSSActiveClass = DSSCircuit.ActiveClass;

% Redirecting to MATLAB
DSSText.command = 'Compile (C:\Users\Afiq Hafizuddin\Documents\MATLAB\BESS-guide\01_Community_BESS\master.dss)'

% Load Flow of the Base System
% Setting the solving mode to daily
% Activation of daily mode

DSSText.Command='Set VoltageBases = "[33 11.3]"';
DSSText.Command='CalcVoltageBases';
DSSText.command='Set MaxControlIter=1000';
DSSText.command='set mode=daily stepsize=1m';
DSSText.Command = 'Set number=1';

% Solving for 2881 minutes
for i = 1:LS
    DSSText.command = 'Solve';
    Voltagebase(:,i) = DSSCircuit.AllNodeVmagPUByPhase(1);
    Voltagecusbefore = Voltagebase([2:5, 6:9, 10:11, 12:14, 15:19, 20:21, 22:26, 27:29, 30:32, 33, 34:36, 37:end],:);
    Loss = DSSCircuit.Losses;
    TPLbase(i,1) = Loss(1,1)/1000;

    DSSCircuit.SetActiveElement(['Transformer.TX1']);
    Source(i,:) = DSSCircuit.ActiveCktElement.Powers;
    Tr_power(i,1) = 1*(Source(i,1)+Source(i,3)+Source(i,5));

    DSSCircuit.SetActiveElement(['Transformer.TX2']);
    Source(i,:) = DSSCircuit.ActiveCktElement.Powers;
    Tr_power(i,2) = 1*(Source(i,1)+Source(i,3)+Source(i,5));

    Grid_power_woB(i,1)=Tr_power(i,1);
    Grid_power_woB(i,2)=Tr_power(i,2);

    % PV Power Extraction
    [P_Gen] = solarextraction(i,DSSObj,DSSText,DSSCircuit,DSSSolution);
    P_Gen_extract(i,:)=P_Gen(i,:);


    % Load Demand Extraction
    [P_L,Q_L] = demandextraction(i,DSSObj,DSSText,DSSCircuit,DSSSolution);
    P_L_extract(i,:)=P_L(i,:);

    % Excess PV Generation
    Excess_P_Gen(i,:)=P_Gen_extract(i,:)-P_L_extract(i,:);

end 


Excess = sum(Excess_P_Gen);
% Voltagecusbefore=Voltagebase([2:5, 6:9, 10:11, 12:14, 15:19, 20:21, 22:26, 27:29, 30:32, 33, 34:36, 37:end],:);
Voltage=Voltagebase([2:5, 6:9, 10:11, 12:14, 15:19, 20:21, 22:26, 27:29, 30:32, 33, 34:36, 37:end],:);

P_Gen_extract(LS+1, 1) = 0;

% Plots before integrating the battery
time = 0:(1/(60)):48;
figure(1)
plot(time, Solarshape, 'r-')
hold on;
plot(time, Loadshape_data, 'b--')
ylabel('Normalised Profile (p,u,)');
xlabel('Time (hr)');
xticks([0:4:48]);
xlim([0 48]);
ylim([0 1.1]);
legend('Solar Profile', 'Load Profile', 'NumColumns', 2);

figure(2)
plot(time, Voltage);
hold on;
plot([0 48], [1.05 1.05], 'r:', 'Linewidth', 1.5);
plot([0 48], [0.95 0.95], 'r:', 'Linewidth', 1.5);
ylabel('Voltage (p.u.)');
xlabel('Time (hr)');
xticks([0:4:48]);
xlim([0 48]);
ylim([0.94 1.06]);

% Charging time
for j=1:LS-1
    if Excess_P_Gen(j,1) < 0 && Excess_P_Gen(j+1,1) > 0
        CHA_start(j,1)=j+1;
    elseif Excess_P_Gen(j,1)>0 && Excess_P_Gen(j+1,1)<0
        CHA_stop(j,1)=j;
    end
end

CHA_start(CHA_start==0) = [1];
CHA_stop(CHA_stop==0) = [1];

% Discharging time
for j=1:LS-1
    if P_Gen_extract(j,1)==0 && P_Gen_extract(j+1,1)>0
        DISCHA_stop(j,1)=j;
    elseif P_Gen_extract(j,1)>0 && P_Gen_extract(j+1,1)==0
        DISCHA_start(j,1)=j+1;
    end
end

DISCHA_start(DISCHA_start==0)=[1];
DISCHA_stop(DISCHA_stop==0)=[1];

%  Load Flow with Battery
SOC_final = 0.83;
SOC_reserve = 0.2;
SOC_end=0.5;

% Redirecting OpenDSS Battery File
DSSText.command = 'Redirect CBESS.dss'

DSSCircuit.SetActiveClass('Storage');
AllStorageNames = DSSActiveClass.AllNames;

% Charging Time
C1=CHA_start(1,1); C2=CHA_stop(1,1); C3=CHA_start(2,1); C4=CHA_stop(2,1);

% Discharging time
D1=DISCHA_stop(1,1); D2=DISCHA_start(1,1); D3=DISCHA_stop(2,1); D4=DISCHA_start(2,1); 

% Stored Energy
SE = 0.8;

% CBESS
RB=1;

BESS_kWh=1500*60;
BESS_kW=500;

% Initial Charging and Discharging Rate
for k = 1:RB
    R_discharge(1,k) = (((SE-SOC_reserve)*BESS_kWh/(D1))/BESS_kW)*100;
end

DSSCircuit.SetActiveClass('Storage');
for g = 1:RB
    DSSCircuit.SetActiveElement(AllStorageNames{g});
    DSSText.command=['Edit Storage.',AllStorageNames{g} ' State = DISCHARGING'];
    DSSText.command=['Edit Storage.',AllStorageNames{g} ' %discharge=',num2str(R_discharge(1,g))];
end

DSSText.Command='Set VoltageBases = "[33 11.3]"';
DSSText.Command='CalcVoltageBases';
DSSText.command='Set MaxControlIter=1000';
DSSText.command='set mode=daily stepsize=1m';
DSSText.Command = 'Set number=1';

for h = 1:LS
    h;
    DSSText.command = 'solve';
    Voltagebat(:,h) = DSSCircuit.AllNodeVmagPUByPhase(1);
    
    Voltagecus = Voltagebase ([2:5, 6:9, 10:11, 12:14, 15:19, 20:21, 22:26, 27:29, 30:32, 33, 34:36, 37:end]);

    Loss=DSSCircuit.Losses;
    TPLbat(h,1) = Loss(1,1)/1000; 

    DSSCircuit.SetActiveElement(['Transformer.TX1']);
    Source_with_bat(h,:) = DSSCircuit.ActiveCktElement.Powers;
    Tr_power_with_bat(h,2) = 1*(Source_with_bat(h,1)+Source_with_bat(h,3)+Source_with_bat(h,5));

    DSSCircuit.SetActiveElement(['Transformer.TX2']);
    Source_with_bat(h,:) = DSSCircuit.ActiveCktElement.Powers;
    Tr_power_with_bat(h,2) = 1*(Source_with_bat(h,1)+Source_with_bat(h,3)+Source_with_bat(h,5));

    Grid_power_wB(h,1)=Tr_power_with_bat(h,1);
    Grid_power_wB(h,2)=Tr_power_with_bat(h,2);

    % Extract SOC
    DSSCircuit.SetActiveClass('Storage');
    for g = 1:RB
        DSSCircuit.SetActiveElement(AllStorageNames{g});
        SOC(h,g)=str2double(DSSCircuit.ActiveDSSElement.Properties('%stored').Val);
        SOC(h,g)=SOC(h,g)/100;
        
        % Extract Battery Power
        bp(h,:) = DSSCircuit.ActiveCktElement.Powers;
        bat_power(h,g)=-1*(bp(h,1)+bp(h,3)+bp(h,5));
    end

    % Check the status and calculate

    % Charging

    if P_Gen_extract(h+1,1)>0
        if Excess(h+1)>0
            if h >= C1-1 && h<=C2-1
                for k = 1:RB
                    R_charge(h+1,k) = (((SOC_final-SOC(h,k))*BESS_kWh/(C2-h))/BESS_kW)*100;
                    R_test(h+1,k)=R_charge(h+1,k);
                end
                % Excess PV Rate
                for k = 1:RB
                    E_PV(h+1,k) = (Excess(k,h+1)/BESS_kW)*100;
                end

                % Adjusting the rate

                for k=1:RB
                    if E_PV(h+1,k)<R_charge(h+1,k)
                        R_charge(h+1,k)=E_PV(h+1,k);
                    end
                end

                DSSCircuit.SetActiveClass('Storage');
                for g = 1:RB
                    DSSCircuit.SetActiveElement(AllStorageNames{g});
                    DSSText.command=['Edit Storage.',AllStorageNames{g} ' State = CHARGING'];
                    DSSText.command=['Edit Storage.',AllStorageNames{g} ' %charge=',num2str(R_charge(h+1,g))];
                end

            elseif  h>=C3-1 && h<=C4-1
                for k = 1:RB
                    R_charge(h+1,k) = (((SOC_final-SOC(h,k))*BESS_kWh/(C4-h))/BESS_kW)*100;
                     R_test(h+1,k)=R_charge(h+1,k);
                end

                % excess PV rate
                for k = 1:RB
                    E_PV(h+1,k) = (Excess(k,h+1)/BESS_kW)*100;
                end

                % Adjusting the rate
                for k=1:RB
                    if E_PV(h+1,k)<R_charge(h+1,k)
                        R_charge(h+1,k)=E_PV(h+1,k);
                    end
                end

                DSSCircuit.SetActiveClass('Storage');
                for g = 1:RB
                    DSSCircuit.SetActiveElement(AllStorageNames{g});
                    DSSText.command=['Edit Storage.',AllStorageNames{g} ' State = CHARGING'];
                    DSSText.command=['Edit Storage.',AllStorageNames{g} ' %charge=',num2str(R_charge(h+1,g))];
                end
            end

            % Idling

        else
            for k = 1:RB
                R_charge(h+1,k) = 0;
                 R_test(h+1,k)=R_charge(h+1,k);
            end

            DSSCircuit.SetActiveClass('Storage');
            for g = 1:RB
                DSSCircuit.SetActiveElement(AllStorageNames{g});
                DSSText.command=['Edit Storage.',AllStorageNames{g} ' State = IDLING'];
                DSSText.command=['Edit Storage.',AllStorageNames{g} ' %charge=',num2str(R_charge(h+1,g))];
            end
        end

        % Discharging

    else
        if h<=D1-1
            for k = 1:RB
                R_discharge(h+1,k) = (((SOC(h,k)-SOC_reserve)*BESS_kWh/(D1-h))/BESS_kW)*100;
                
            end
            DSSCircuit.SetActiveClass('Storage');
            
            for g = 1:RB
                DSSCircuit.SetActiveElement(AllStorageNames{g});
                DSSText.command=['Edit Storage.',AllStorageNames{g} ' State = DISCHARGING'];
                DSSText.command=['Edit Storage.',AllStorageNames{g} ' %discharge=',num2str(R_discharge(h+1,g))];
            end

        elseif h>=(D2-1) && h<=(D3-1)
            for k = 1:RB
                R_discharge(h+1,k) = (((SOC(h,k)-SOC_reserve)*BESS_kWh/(D3-h))/BESS_kW)*100;
            end

            DSSCircuit.SetActiveClass('Storage');
            for g = 1:RB
                DSSCircuit.SetActiveElement(AllStorageNames{g});
                DSSText.command=['Edit Storage.',AllStorageNames{g} ' State = DISCHARGING'];
                DSSText.command=['Edit Storage.',AllStorageNames{g} ' %discharge=',num2str(R_discharge(h+1,g))];
            end

        elseif h>=(D4-1) && h<=2880
            for k = 1:RB
                R_discharge(h+1,k) = (((SOC(h,k)-SOC_end)*BESS_kWh/(LS-h))/BESS_kW)*100;
            end

            DSSCircuit.SetActiveClass('Storage');
            for g = 1:RB
                DSSCircuit.SetActiveElement(AllStorageNames{g});
                DSSText.command=['Edit Storage.',AllStorageNames{g} ' State = DISCHARGING'];
                DSSText.command=['Edit Storage.',AllStorageNames{g} ' %discharge=',num2str(R_discharge(h+1,g))];
            end
        end
    end
end

figure(3)
plot(time, Voltagecus')
hold on;
plot([0 48],[1.05 1.05],'r:','Linewidth',1.5);
plot([0 48],[0.95 0.95],'r:','Linewidth',1.5);
ylabel('Voltage (p.u.)');
xlabel('Time (hr)');
xticks([0:4:48]);
xlim([0 48]);
ylim([0.94 1.06]);

figure(4)
plot(time,Grid_power_woB)
hold on
plot(time,Grid_power_wB)
ylabel('Power (kW)');
xlabel('Time (hr)');
xticks([0:4:48]);
xlim([0 48]);
legend('Without CBESS','With CBESS');

%  SOC
figure(5);
plot(time,SOC*100)
xticks([0:4:48]);
xlim([0 48]);
xlabel('Time (hr)')
ylabel('SoC (%)')
ylim([0 100]);

% Losses
figure(6);
plot(time,TPLbase,'--','Color','[0 0.4 1]','LineWidth',1);
hold on;
plot(time,TPLbat,'-','Color','[1 0 0.8]','LineWidth',1);
hold off;
xticks([0:4:48]);
xlim([0 48]);
xlabel('Time (hr)')
ylabel('Loss (kW)')
legend('Without CBESS', 'With CBESS','FontSize',8);











