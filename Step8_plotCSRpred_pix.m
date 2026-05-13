%% ==============================================================================================
%  Function: Calculation of average changes in CSR ecological strategy, from the historical period (1970-2000) to four future periods 
%  (2021-2040, 2041-2060, 2061-2080, and 2081-2100) under CMIP6 future climate scenarios, based on 10 global climate models (GCMs; see Materials).  
%
%  Author: Jing Wang
%  Date: 2025/08/08
%% ==============================================================================================
function Step8_plotCSRpred_pix

load Cstra_change_scenerio_year 
load Sstra_change_scenerio_year 
load Rstra_change_scenerio_year 
load Cstra_std_scenerio_year 
load Sstra_std_scenerio_year 
load Rstra_std_scenerio_year 
load GPP_change_mean_scenerio_year 
load GPP_change_std_scenerio_year
mean(Cstra_change_scenerio_year(:,end))
mean(Sstra_change_scenerio_year(:,end))
mean(Rstra_change_scenerio_year(:,end))
mean(GPP_change_mean_scenerio_year(:,end))

figure;errorbar(Cstra_change_scenerio_year(1,:),Cstra_std_scenerio_year(1,:),'color',[251,154,153]/255,'LineWidth', 2)
hold on;errorbar(Cstra_change_scenerio_year(2,:),Cstra_std_scenerio_year(2,:),'color',[51,160,44]/255,'LineWidth', 2)
errorbar(Cstra_change_scenerio_year(3,:),Cstra_std_scenerio_year(3,:),'color',[31,120,180]/255,'LineWidth', 2)
errorbar(Cstra_change_scenerio_year(4,:),Cstra_std_scenerio_year(4,:),'color',[253,191,111]/255,'LineWidth', 2)
legend({'ssp126','ssp245','ssp370','ssp585'})
xlim([0.5,4.5])
% ylim([24,24.5])
xticks([0.5,1:1:4,4.5])
% yticks([24:0.1:24.5])
xticklabels({[],'2021-2040','2041-2060','2061-2080','2081-2100',[]})
set(gca,'linewidth',1,'FontSize',16)

figure;errorbar(Sstra_change_scenerio_year(1,:),Sstra_std_scenerio_year(1,:),'color',[251,154,153]/255,'LineWidth', 2)
hold on;errorbar(Sstra_change_scenerio_year(2,:),Sstra_std_scenerio_year(2,:),'color',[51,160,44]/255,'LineWidth', 2)
errorbar(Sstra_change_scenerio_year(3,:),Sstra_std_scenerio_year(3,:),'color',[31,120,180]/255,'LineWidth', 2)
errorbar(Sstra_change_scenerio_year(4,:),Sstra_std_scenerio_year(4,:),'color',[253,191,111]/255,'LineWidth', 2)
legend({'ssp126','ssp245','ssp370','ssp585'})
xlim([0.5,4.5])
% ylim([62.15,62.55])
xticks([0.5,1:1:4,4.5])
% yticks([62:0.1:62.5])
xticklabels({[],'2021-2040','2041-2060','2061-2080','2081-2100',[]})
set(gca,'linewidth',1,'FontSize',16)

figure;errorbar(Rstra_change_scenerio_year(1,:),Rstra_std_scenerio_year(1,:),'color',[251,154,153]/255,'LineWidth', 2)
hold on;errorbar(Rstra_change_scenerio_year(2,:),Rstra_std_scenerio_year(2,:),'color',[51,160,44]/255,'LineWidth', 2)
errorbar(Rstra_change_scenerio_year(3,:),Rstra_std_scenerio_year(3,:),'color',[31,120,180]/255,'LineWidth', 2)
errorbar(Rstra_change_scenerio_year(4,:),Rstra_std_scenerio_year(4,:),'color',[253,191,111]/255,'LineWidth', 2)
legend({'ssp126','ssp245','ssp370','ssp585'})
xlim([0.5,4.5])
% ylim([13.4,13.6])
xticks([0.5,1:1:4,4.5])
% yticks([13.4:0.05:13.6])
xticklabels({[],'2021-2040','2041-2060','2061-2080','2081-2100',[]})
set(gca,'linewidth',1,'FontSize',16)

figure;bar(1,Cstra_change_scenerio_year(1,end),'FaceColor',[251,154,153]/255,'LineWidth',1)
hold on;bar(2,Cstra_change_scenerio_year(2,end),'FaceColor',[51,160,44]/255,'LineWidth',1)
bar(3,Cstra_change_scenerio_year(3,end),'FaceColor',[31,120,180]/255,'LineWidth',1)
bar(4,Cstra_change_scenerio_year(4,end),'FaceColor',[253,191,111]/255,'LineWidth',1)
xlim([0,5])
% ylim([-0.35,0])
xticks([0:1:5])
% yticks([-0.3:0.1:0])
xticklabels({[],[],[],[]})
set(gca,'linewidth',2,'FontSize',16)

figure;bar(1,Sstra_change_scenerio_year(1,end),'FaceColor',[251,154,153]/255,'LineWidth',1)
hold on;bar(2,Sstra_change_scenerio_year(2,end),'FaceColor',[51,160,44]/255,'LineWidth',1)
bar(3,Sstra_change_scenerio_year(3,end),'FaceColor',[31,120,180]/255,'LineWidth',1)
bar(4,Sstra_change_scenerio_year(4,end),'FaceColor',[253,191,111]/255,'LineWidth',1)
xlim([0,5])
% ylim([0,0.3])
xticks([0:1:5])
% yticks([0:0.1:0.3])
xticklabels({[],[],[],[]})
set(gca,'linewidth',2,'FontSize',16)

figure;bar(1,Rstra_change_scenerio_year(1,end),'FaceColor',[251,154,153]/255,'LineWidth',1)
hold on;bar(2,Rstra_change_scenerio_year(2,end),'FaceColor',[51,160,44]/255,'LineWidth',1)
bar(3,Rstra_change_scenerio_year(3,end),'FaceColor',[31,120,180]/255,'LineWidth',1)
bar(4,Rstra_change_scenerio_year(4,end),'FaceColor',[253,191,111]/255,'LineWidth',1)
xlim([0,5])
% ylim([0,0.12])
xticks([0:1:5])
% yticks([0:0.03:0.12])
xticklabels({[],[],[],[]})
set(gca,'linewidth',2,'FontSize',16)

figure;errorbar(GPP_change_mean_scenerio_year(1,:),GPP_change_std_scenerio_year(1,:),'color',[251,154,153]/255,'LineWidth', 2)
hold on;errorbar(GPP_change_mean_scenerio_year(2,:),GPP_change_std_scenerio_year(2,:),'color',[51,160,44]/255,'LineWidth', 2)
errorbar(GPP_change_mean_scenerio_year(3,:),GPP_change_std_scenerio_year(3,:),'color',[31,120,180]/255,'LineWidth', 2)
errorbar(GPP_change_mean_scenerio_year(4,:),GPP_change_std_scenerio_year(4,:),'color',[253,191,111]/255,'LineWidth', 2)
legend({'ssp126','ssp245','ssp370','ssp585'})
xlim([0,5])
xticks([0:1:5])
xticklabels({[],'2021-2040','2041-2060','2061-2080','2081-2100',[]})
set(gca,'linewidth',2,'FontSize',16)

figure;bar(1,GPP_change_mean_scenerio_year(1,end),'FaceColor',[251,154,153]/255,'LineWidth',1)
hold on;bar(2,GPP_change_mean_scenerio_year(2,end),'FaceColor',[51,160,44]/255,'LineWidth',1)
bar(3,GPP_change_mean_scenerio_year(3,end),'FaceColor',[31,120,180]/255,'LineWidth',1)
bar(4,GPP_change_mean_scenerio_year(4,end),'FaceColor',[253,191,111]/255,'LineWidth',1)
xlim([0,5])
% ylim([-400,0])
xticks([0:1:5])
% yticks([-400:100:0])
xticklabels({'','ssp126','ssp245','ssp370','ssp585'})
set(gca,'linewidth',2,'FontSize',16)

