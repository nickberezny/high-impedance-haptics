load("data.mat")

%--------------------------------------------------------
%Bode: IC + Modelling Err
ctl = 2;
tdelay = 1;

freqs = logspace(-1,3,500);
lowInd = 250;

figure('Position',[200,200,500,400])
tcl = tiledlayout(2,1);
nexttile(tcl)
hold on
semilogx(freqs([1:25:500]),mag{tdelay}{1}{1}([1:25:500]),'*')
semilogx(freqs,mag{tdelay}{1}{ctl})
semilogx(freqs,mag{tdelay}{3}{ctl})
semilogx(freqs,mag{tdelay}{5}{ctl})
ylabel('Magnitude (db)','Interpreter','latex')
xlabel('Frequency (rad/s)','Interpreter','latex')
xlim([0.1 10])
ylim([15 40])
set(gca, 'XScale', 'log');

nexttile(tcl)
hold on
plot(freqs([1:25:500]),phase{tdelay}{1}{1}([1:25:500]),'*')
plot(freqs,phase{tdelay}{1}{ctl})
plot(freqs,phase{tdelay}{3}{ctl})
plot(freqs,phase{tdelay}{5}{ctl})
ylabel('Phase (rad)','Interpreter','latex')
xlabel('Frequency (rad/s)','Interpreter','latex')
xlim([0.1 10])
set(gca, 'XScale', 'log');

leg = legend('Desired System','0.96','1','1.04','Orientation','horizontal','Interpreter','latex')
title(leg,"Modelling Error ($\%$)",'Interpreter','latex')
leg.Layout.Tile = 'North';

%---------------------------------------------------------------------------
%Bode: AC + Time Delay
ctl = 4;
tdelay = 1;
merr = 1;

freqs = logspace(-1,3,500);
lowInd = 250;

figure('Position',[200,200,500,400])
tcl = tiledlayout(2,1);
nexttile(tcl)
hold on
semilogx(freqs([1:25:500]),mag{1}{merr}{1}([1:25:500]),'*')
semilogx(freqs,mag{1}{merr}{ctl})
semilogx(freqs,mag{3}{merr}{ctl})
semilogx(freqs,mag{5}{merr}{ctl})
ylabel('Magnitude (db)','Interpreter','latex')
xlabel('Frequency (rad/s)','Interpreter','latex')
xlim([0.1 1000])
ylim([15 80])
set(gca, 'XScale', 'log');

nexttile(tcl)
hold on
plot(freqs([1:25:500]),phase{1}{merr}{1}([1:25:500]),'*')
plot(freqs,phase{1}{merr}{ctl})
plot(freqs,phase{3}{merr}{ctl})
plot(freqs,phase{5}{merr}{ctl})
ylabel('Phase (rad)','Interpreter','latex')
xlabel('Frequency (rad/s)','Interpreter','latex')
xlim([0.1 1000])
set(gca, 'XScale', 'log');

leg = legend('Desired System','0','4','8','Orientation','horizontal')
title(leg,"Time Delay (ms)",'Interpreter','latex')
leg.Layout.Tile = 'North';


%-------------------------------------------------------
%Effective Parameters: Modelling Errr
ctl = 2;
tdelay = 1;

figure('Position',[200,200,500,500])
tcl = tiledlayout(3,1);
nexttile(tcl)
semilogx(freqs,be{tdelay}{1}{ctl})
semilogx(freqs,be{tdelay}{3}{ctl})
semilogx(freqs,be{tdelay}{5}{ctl})
xlim([0.1 1000])
ylim([0,15])
ylabel('$b_e$ (Ns/m)','Interpreter','latex')
xlabel('Frequency (rad/s)','Interpreter','latex')
set(gca, 'XScale', 'log');


nexttile(tcl)
hold on
semilogx(freqs,me{tdelay}{1}{ctl})
semilogx(freqs,me{tdelay}{3}{ctl})
semilogx(freqs,me{tdelay}{5}{ctl})
xlim([0.1 1000])
ylim([9,11])
ylabel('$m_e$ (kg)','Interpreter','latex')
xlabel('Frequency (rad/s)','Interpreter','latex')
set(gca, 'XScale', 'log');

nexttile(tcl)
hold on
semilogx(freqs,je{tdelay}{1}{ctl})
semilogx(freqs,je{tdelay}{3}{ctl})
semilogx(freqs,je{tdelay}{5}{ctl})
xlim([0.1 1000])
ylabel('$j_e$ (kgs)','Interpreter','latex')
xlabel('Frequency (rad/s)','Interpreter','latex')
set(gca, 'XScale', 'log');

leg = legend('Desired System','0.96','1','1.04','Orientation','horizontal','Interpreter','latex')
title(leg,"Modelling Error ($\%$)",'Interpreter','latex')
leg.Layout.Tile = 'North';

%-------------------------------------------------------
%Effective Parameters: Time Delay
ctl = 4;
merr = 3;

figure('Position',[200,200,500,500])
tcl = tiledlayout(3,1);
nexttile(tcl)
semilogx(freqs,be{1}{merr}{ctl})
semilogx(freqs,be{3}{merr}{ctl})
semilogx(freqs,be{5}{merr}{ctl})
xlim([0.1 1000])
ylim([0,15])
ylabel('$b_e$ (Ns/m)','Interpreter','latex')
xlabel('Frequency (rad/s)','Interpreter','latex')
set(gca, 'XScale', 'log');


nexttile(tcl)
hold on
semilogx(freqs,me{1}{merr}{ctl})
semilogx(freqs,me{3}{merr}{ctl})
semilogx(freqs,me{5}{merr}{ctl})
xlim([0.1 1000])
ylim([0,15])
ylabel('$m_e$ (kg)','Interpreter','latex')
xlabel('Frequency (rad/s)','Interpreter','latex')
set(gca, 'XScale', 'log');

nexttile(tcl)
hold on
semilogx(freqs,je{1}{merr}{ctl})
semilogx(freqs,je{3}{merr}{ctl})
semilogx(freqs,je{5}{merr}{ctl})
xlim([0.1 1000])
ylabel('$j_e$ (kgs)','Interpreter','latex')
xlabel('Frequency (rad/s)','Interpreter','latex')
set(gca, 'XScale', 'log');

leg = legend('0','4','8','Orientation','horizontal')
title(leg,"Time Delay (ms)",'Interpreter','latex')
leg.Layout.Tile = 'North';



ctl = 2; 
figure('Position',[200,200,500,500])
tcl = tiledlayout(3,1);
nexttile(tcl)
semilogx(freqs,be{1}{merr}{ctl})
semilogx(freqs,be{3}{merr}{ctl})
semilogx(freqs,be{5}{merr}{ctl})
xlim([0.1 1000])
ylim([0,15])
ylabel('$b_e$ (Ns/m)','Interpreter','latex')
xlabel('Frequency (rad/s)','Interpreter','latex')
set(gca, 'XScale', 'log');


nexttile(tcl)
hold on
semilogx(freqs,me{1}{merr}{ctl})
semilogx(freqs,me{3}{merr}{ctl})
semilogx(freqs,me{5}{merr}{ctl})
xlim([0.1 1000])
ylim([0,15])
ylabel('$m_e$ (kg)','Interpreter','latex')
xlabel('Frequency (rad/s)','Interpreter','latex')
set(gca, 'XScale', 'log');

nexttile(tcl)
hold on
semilogx(freqs,je{1}{merr}{ctl})
semilogx(freqs,je{3}{merr}{ctl})
semilogx(freqs,je{5}{merr}{ctl})
xlim([0.1 1000])
ylabel('$j_e$ (kgs)','Interpreter','latex')
xlabel('Frequency (rad/s)','Interpreter','latex')
set(gca, 'XScale', 'log');

leg = legend('0','4','8','Orientation','horizontal')
title(leg,"Time Delay (ms)",'Interpreter','latex')
leg.Layout.Tile = 'North';


%--------------------------------------------------------
load("Mds.mat");
ctl = 2;

figure
hold on
semilogx(freqs,-je{1}{1}{4}+je{1}{1}{ctl})
semilogx(freqs,-je{1}{2}{4}+je{1}{2}{ctl})
semilogx(freqs,-je{1}{3}{4}+je{1}{3}{ctl})
xlim([0.1 1000])
ylabel('Difference in $j_e$ (kgs)','Interpreter','latex')
xlabel('Frequency (rad/s)','Interpreter','latex')
set(gca, 'XScale', 'log');

leg = legend('50','30','10','Orientation','horizontal','Location','northoutside')
title(leg,"$m_d$ (kg)",'Interpreter','latex')


