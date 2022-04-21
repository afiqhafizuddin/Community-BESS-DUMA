function [P_L,Q_L] = demandextraction(i,DSSObj,DSSText,DSSCircuit,DSSSolution)

    % DSSCircuit.SetActiveElement('Load.LOAD1');
    % S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    % P_L(i,1)=1*(S_L(1)+S_L(3)+S_L(5));
    % Q_L(i,1)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD2');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,2)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,2)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD3');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,3)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,3)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD4');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,4)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,4)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD5');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,5)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,5)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD6');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,6)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,6)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD7');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,7)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,7)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD8');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,8)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,8)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD9');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,9)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,9)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD10');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,10)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,10)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD11');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,11)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,11)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD12');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,12)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,12)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD13');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,13)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,13)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD14');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,14)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,14)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD15');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,15)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,15)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD16');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,16)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,16)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD17');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,17)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,17)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD18');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,18)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,18)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD19');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,19)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,19)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD20');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,20)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,20)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD21');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,21)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,21)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD22');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,22)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,22)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD23');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,23)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,23)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD24');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,24)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,24)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD25');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,25)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,25)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD26');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,26)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,26)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD27');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,27)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,27)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD28');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,28)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,28)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD29');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,29)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,29)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD30');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,30)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,30)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD31');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,31)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,31)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD32');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,32)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,32)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD33');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,33)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,33)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD34');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,34)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,34)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD35');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,35)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,35)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD36');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,36)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,36)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD37');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,37)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,37)=1*(S_L(2)+S_L(4)+S_L(6));;
    
    DSSCircuit.SetActiveElement('Load.LOAD38');
    S_L=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L(i,38)=1*(S_L(1)+S_L(3)+S_L(5));
    Q_L(i,38)=1*(S_L(2)+S_L(4)+S_L(6));;
end