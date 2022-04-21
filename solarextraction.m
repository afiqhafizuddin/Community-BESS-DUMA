function [P_Gen] = solarextraction(i,DSSObj,DSSText,DSSCircuit,DSSSolution)

DSSCircuit.SetActiveElement('PVSystem.PV1');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,1)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV2');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,2)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV3');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,3)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV4');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,4)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV5');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,5)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV6');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,6)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV7');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,7)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV8');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,8)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV9');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,9)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV10');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,10)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV11');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,11)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV12');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,12)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV13');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,13)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV14');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,14)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV15');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,15)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV16');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,16)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV17');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,17)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV18');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,18)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV19');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,19)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV20');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,20)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV21');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,21)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV22');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,22)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV23');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,23)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV24');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,24)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV25');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,25)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV26');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,26)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV27');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,27)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV28');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,28)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV29');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,29)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV30');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,30)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV31');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,31)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV32');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,32)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV33');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,33)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV34');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,34)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV35');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,35)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV36');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,36)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV37');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,37)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));

DSSCircuit.SetActiveElement('PVSystem.PV38');
S_Gen1=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
P_Gen(i,38)=-1*(S_Gen1(1)+S_Gen1(3)+S_Gen1(5));
end