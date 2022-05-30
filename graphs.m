tt= 0:240:2881;
ttt=0:4:48;
figure()
x0=10;
y0=10;
width=1000;
height=400;
set(gcf,'position',[x0,y0,width,height])

annotation('doublearrow',[0.13 0.2350],[0.2104 0.2104])
annotation('doublearrow',[0.2350 0.415],[0.2104 0.2104])
annotation('doublearrow',[0.415 0.6230],[0.2104 0.2104])
annotation('doublearrow',[0.415 0.8],[0.2104 0.2104])
annotation('doublearrow',[0.80 0.905],[0.2104 0.2104])
plot(Solarshape,'r');
hold on;
plot(Loadshape_data,'--b');
plot([D1 D1],[0 1.05],':k');
plot([D2 D2],[0 1.05],':k');
plot([D3 D3],[0 1.05],':k');
plot([D4 D4],[0 1.05],':k');
x1=[0 D1 D1 0];
y1=[0 0 1.05 1.05];
P1=patch(x1,y1,[1 0.8 0],'FaceAlpha',0.2,'EdgeColor','None');
x2=[D2 D3 D3 D2];
y2=[0 0 1.05 1.05];
P2=patch(x2,y2,[1 0.8 0],'FaceAlpha',0.2,'EdgeColor','None');
x3=[D4 2881 2881 D4];
y3=[0 0 1.05 1.05];
P3=patch(x3,y3,[1 0.8 0],'FaceAlpha',0.2,'EdgeColor','None');

txt = {'Discharging time'};
text(50,0.20,txt,'FontSize',8)
txt = {'Charging time'};
text(600,0.20,txt,'FontSize',8)
txt = {'Discharging time'};
text(1275,0.20,txt,'FontSize',8)
txt = {'Charging time'};
text(2050,0.20,txt,'FontSize',8)
txt = {'Discharging time'};
text(2530,0.20,txt,'FontSize',8)

% uistack(P1,'bottom');

ylabel('Normalized Profile (p.u.)');
xlabel('Time (hr)');
xticks(tt);
xticklabels([ttt]);
xlim([0 2881]);
ylim([0 1.05]);
legend('Solar Profile','Load Profile','NumColumns',2);