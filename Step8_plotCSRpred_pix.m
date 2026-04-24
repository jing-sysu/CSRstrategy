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

% % plot model lines
% Cstra_mean_all=plot_strapred(Cstra_mean);
% Sstra_mean_all=plot_strapred(Sstra_mean);
% Rstra_mean_all=plot_strapred(Rstra_mean);
% 
% % plot model lines
% Cstra_change_scenerio_year=Cstra_mean_all([4,8,12,16])-Cstra_mean_ori;
% Sstra_change_scenerio_year=Sstra_mean_all([4,8,12,16])-Sstra_mean_ori;
% Rstra_change_scenerio_year=Rstra_mean_all([4,8,12,16])-Rstra_mean_ori;
% 
% % plot scenerio pie
% figure;
% subplot(2,2,1);pie(abs([Cstra_change_scenerio_year(1),Sstra_change_scenerio_year(1),Rstra_change_scenerio_year(1)]));title("ssp126");
% subplot(2,2,2);pie(abs([Cstra_change_scenerio_year(2),Sstra_change_scenerio_year(2),Rstra_change_scenerio_year(2)]));title("ssp245");
% subplot(2,2,3);pie(abs([Cstra_change_scenerio_year(3),Sstra_change_scenerio_year(3),Rstra_change_scenerio_year(3)]));title("ssp370");
% subplot(2,2,4);pie(abs([Cstra_change_scenerio_year(4),Sstra_change_scenerio_year(4),Rstra_change_scenerio_year(4)]));title("ssp585");
% legend(["C","S","R"]);
% 
% Cstra_change_scenerio_year2=[Cstra_mean_all(4)-Cstra_mean_all(1),Cstra_mean_all(8)-Cstra_mean_all(5),Cstra_mean_all(12)-Cstra_mean_all(9),Cstra_mean_all(16)-Cstra_mean_all(13)];
% Sstra_change_scenerio_year2=[Sstra_mean_all(4)-Sstra_mean_all(1),Sstra_mean_all(8)-Sstra_mean_all(5),Sstra_mean_all(12)-Sstra_mean_all(9),Sstra_mean_all(16)-Sstra_mean_all(13)];
% Rstra_change_scenerio_year2=[Rstra_mean_all(4)-Rstra_mean_all(1),Rstra_mean_all(8)-Rstra_mean_all(5),Rstra_mean_all(12)-Rstra_mean_all(9),Rstra_mean_all(16)-Rstra_mean_all(13)];
% 
% figure;
% subplot(2,2,1);pie(abs([Cstra_change_scenerio_year2(1),Sstra_change_scenerio_year2(1),Rstra_change_scenerio_year2(1)])./sum(abs([Cstra_change_scenerio_year2(1),Sstra_change_scenerio_year2(1),Rstra_change_scenerio_year2(1)])));title("ssp126");
% subplot(2,2,2);pie(abs([Cstra_change_scenerio_year2(2),Sstra_change_scenerio_year2(2),Rstra_change_scenerio_year2(2)])./sum(abs([Cstra_change_scenerio_year2(2),Sstra_change_scenerio_year2(2),Rstra_change_scenerio_year2(2)])));title("ssp245");
% subplot(2,2,3);pie(abs([Cstra_change_scenerio_year2(3),Sstra_change_scenerio_year2(3),Rstra_change_scenerio_year2(3)])./sum(abs([Cstra_change_scenerio_year2(3),Sstra_change_scenerio_year2(3),Rstra_change_scenerio_year2(3)])));title("ssp370");
% subplot(2,2,4);pie(abs([Cstra_change_scenerio_year2(4),Sstra_change_scenerio_year2(4),Rstra_change_scenerio_year2(4)])./sum(abs([Cstra_change_scenerio_year2(4),Sstra_change_scenerio_year2(4),Rstra_change_scenerio_year2(4)])));title("ssp585");
% legend(["C","S","R"]);

function stra_mean_all=plot_strapred(stra_mean)
stra_mean_model=reshape(stra_mean,10,16);
% color_customize=[215,48,39;244,109,67;253,174,97;254,224,144;255,255,191;224,243,248;173,217,233;116,173,209;69,117,180;84,39,136]./255;
color_customize=[166,206,227;31,120,180;178,223,138;51,160,44;251,154,153;227,26,28;253,191,111;255,127,0;202,178,214;84,39,136]./255;
figure('Position', [10 10 1200 500]);hold on
for i=1:10
    plot(stra_mean_model(i,:),"LineWidth",2,'color',color_customize(i,:))
end
stra_mean_all=mean(stra_mean_model);
plot(stra_mean_all,"LineWidth",2,'color','k')
xticks(1:size(stra_mean_all,2))
xticklabels(strsplit(num2str([2040 2060 2080 2100 2040 2060 2080 2100 2040 2060 2080 2100 2040 2060 2080 2100])));
box on
ylabel("Strategy")
xlabel("Year")
legend("ACCESS-CM2","BCC-CSM2-MR","CMCC-ESM2","EC-Earth3-Veg","INM-CM5-0","IPSL-CM6A-LR","MIROC6","MPI-ESM1-2-HR","MRI-ESM2-0","UKESM1-0-LL",'Mean')
hold off

function [Cstra_predmean,Sstra_predmean,Rstra_predmean,Cstra_predstd,Sstra_predstd,Rstra_predstd,GPP_predmean,GPP_predstd]=read_scenario(filedir_C,filedir_S,filedir_R,intv,Cstra_ori,Sstra_ori,Rstra_ori)
Cstra_pred_model=zeros(size(Cstra_ori,1),4,length(filedir_C)/4);
Sstra_pred_model=zeros(size(Sstra_ori,1),4,length(filedir_C)/4);
Rstra_pred_model=zeros(size(Rstra_ori,1),4,length(filedir_C)/4);
for i=intv:4:length(filedir_C)
    Cstra_pred=load([filedir_C(i).folder,'\',filedir_C(i).name]);
    Cstra_pred=cell2mat(struct2cell(Cstra_pred));

    Sstra_pred=load([filedir_S(i).folder,'\',filedir_S(i).name]);
    Sstra_pred=cell2mat(struct2cell(Sstra_pred));

    Rstra_pred=load([filedir_R(i).folder,'\',filedir_R(i).name]);
    Rstra_pred=cell2mat(struct2cell(Rstra_pred));

    CSRstra_all=(Cstra_pred+Sstra_pred+Rstra_pred);
    Cstra_pred_model(:,:,ceil(i/4))=Cstra_pred./CSRstra_all*100;
    Sstra_pred_model(:,:,ceil(i/4))=Sstra_pred./CSRstra_all*100;
    Rstra_pred_model(:,:,ceil(i/4))=Rstra_pred./CSRstra_all*100;    
end
Cstra_pred=squeeze(mean(Cstra_pred_model,3))-Cstra_ori+(23.6597-24.0914);
Sstra_pred=squeeze(mean(Sstra_pred_model,3))-Sstra_ori+(62.4023-62.1830);
Rstra_pred=squeeze(mean(Rstra_pred_model,3))-Rstra_ori+(13.938-13.7256);

% plot_imghist(Cstra_pred)
% plot_imghist(Sstra_pred)
% plot_imghist(Rstra_pred)

Cstra_predimgstd=squeeze(std(Cstra_pred_model-Cstra_ori+(23.6597-24.0914),[],3));
Sstra_predimgstd=squeeze(std(Sstra_pred_model-Sstra_ori+(62.4023-62.1830),[],3));
Rstra_predimgstd=squeeze(std(Rstra_pred_model-Rstra_ori+(13.938-13.7256),[],3));
% plot_imgstd(Cstra_predimgstd)
% plot_imgstd(Sstra_predimgstd)
% plot_imgstd(Rstra_predimgstd)

Cstra_predmean=mean(Cstra_pred,1);
Sstra_predmean=mean(Sstra_pred,1);
Rstra_predmean=mean(Rstra_pred,1);

Cstra_predstd=std(squeeze(mean(Cstra_pred_model,1))-mean(Cstra_ori,1),[],2);
Sstra_predstd=std(squeeze(mean(Sstra_pred_model,1))-mean(Sstra_ori,1),[],2);
Rstra_predstd=std(squeeze(mean(Rstra_pred_model,1))-mean(Rstra_ori,1),[],2);

Pram1=1.0e+04 *0.0940; %1.0e+04 * 0.0922;
Pram2=1.0e+04 *(-0.0553); %1.0e+04 *(-0.0463);
Pram3=1.0e+04 *(-0.0051);%1.0e+03 *0.1433;
stra_change_scenerio_year=Pram1*Cstra_pred+ Pram2*Sstra_pred +Pram3*Rstra_pred;
GPP_predmean=mean(stra_change_scenerio_year,1);
GPP_predimgmean=Pram1*(squeeze(mean(Cstra_pred_model,1))-mean(Cstra_ori,1))+Pram2*(squeeze(mean(Sstra_pred_model,1))-mean(Sstra_ori,1))+Pram3*(squeeze(mean(Rstra_pred_model,1))-mean(Rstra_ori,1));
GPP_predstd=std(GPP_predimgmean,[],2);
% plot_imghist(stra_change_scenerio_year)

GPP_predimgstd=squeeze(std(Pram1*(Cstra_pred_model-Cstra_ori+(23.6597-24.0914))+Pram2*(Sstra_pred_model-Sstra_ori+(62.4023-62.1830))+Pram3*(Rstra_pred_model-Rstra_ori+(13.938-13.7256)),[],3));
% plot_imgstd(GPP_predimgstd)

[C_stra,Cstra_info]=readgeoraster('C_stra.tif');%('C_stra.tif');
C_stra=imresize(C_stra,1/5,'bilinear');
Cstra_info.RasterSize = [size(C_stra,1),size(C_stra,2)];
[C_stra_XX,C_stra_YY]=meshgrid(1:size(C_stra,2),1:size(C_stra,1));
C_stra_X=Cstra_info.LongitudeLimits(1)+Cstra_info.CellExtentInLongitude*(C_stra_XX-1);
C_stra_Y=Cstra_info.LatitudeLimits(2)-Cstra_info.CellExtentInLatitude*(C_stra_YY-1);
[gpp_image,gpp_info]=readgeoraster('D:\learning_SYSU\CSR\GEE_traitmapping\version2\PPTimage\CSRvsGPP\gpp_23yearmean.tif');

[col,row]=geographicToIntrinsic(gpp_info,C_stra_Y,C_stra_X);
col(col>size(gpp_image,2))=size(gpp_image,2);
gpp_subimage=single(nan(size(C_stra)));
row=single(round(row));
col=single(round(col));
for i=1:size(row,1)
    ind_i=sub2ind(size(gpp_image),row(i,:),col(i,:));
    gpp_subimage(i,:)=single(gpp_image(ind_i));
end
load valid_num_res5.mat
gpp_subimage=gpp_subimage(valid_num(:));
gpp_prcimage=mean(stra_change_scenerio_year,'omitnan')./804.69

function plot_imghist(Cstra_pred)
load valid_num_res5.mat
Cstra_img=nan(size(valid_num));
Cstra_img(valid_num)=Cstra_pred(:,end);
imAlpha=ones(size(valid_num));
imAlpha(isnan(Cstra_img))=0;
figure;imagesc(Cstra_img,'AlphaData',imAlpha)
set(gca,'xticklabel',{[]})
set(gca,'yticklabel',{[]})
caxis([-30,30]) % strategy
% caxis([-40000,40000])% GPP 
bwr = createcolormap([84,48,5]./255,[112,64,7.5]./255,[140,81,10]./255,[1,1,1],[1,102,94]./255,[0,81,71]./255,[0,60,48]./255); %256x3 array
colormap(bwr)
colorbar; 
set(gcf,'Position', [10 10 1200 600]);

post=Cstra_pred(:,end)>0;
figure;histogram(Cstra_pred(post,end),'BinWidth',0.5,'FaceColor',[53,151,143]./255)%[0,136,55]./255
hold on;histogram(Cstra_pred(~post,end),'BinWidth',0.5,'FaceColor',[191,129,45]./255)%[123,50,148]./255 % strategy
% figure;histogram(Cstra_pred(post,end),'BinWidth',500,'FaceColor',[53,151,143]./255)%[0,136,55]./255
% hold on;histogram(Cstra_pred(~post,end),'BinWidth',500,'FaceColor',[191,129,45]./255)%[123,50,148]./255 % GPP
yticlab= get(gca,'ytick');
ymaxlab= round(yticlab(end)./size(Cstra_pred,1)/0.02)*0.02;%strategy
% ymaxlab= 0.1;%GPP
ylim([0,round(size(Cstra_pred,1)*ymaxlab)]);
set(gca,'YTick',0:round(size(Cstra_pred,1)*0.02):round(size(Cstra_pred,1)*ymaxlab));
ylimfq=roundn(yticks/size(Cstra_pred,1),-2);
set(gca,'YTicklabel',num2cell(ylimfq))
set(gca,'linewidth',2,'FontSize',16)
xlim([-30,30])% strategy
% xlim([-40000,40000])% GPP 
sum(post)./size(Cstra_pred,1)

function plot_imgstd(Cstra_pred)
load valid_num_res5.mat
Cstra_img=nan(size(valid_num));
Cstra_img(valid_num)=Cstra_pred(:,end);
imAlpha=ones(size(valid_num));
imAlpha(isnan(Cstra_img))=0;
figure;imagesc(Cstra_img,'AlphaData',imAlpha)
set(gca,'xticklabel',{[]})
set(gca,'yticklabel',{[]})
% caxis([0,5]) % strategy
caxis([0,5000])% GPP 
colorbar; 
set(gcf,'Position', [10 10 1200 600]);

% figure;histogram(Cstra_pred,'BinWidth',0.05,'Normalization','probability','FaceColor',[0.24,0.15,0.66])%[0,136,55]./255 % strategy
figure;histogram(Cstra_pred,'BinWidth',50,'Normalization','probability','FaceColor',[0.24,0.15,0.66])%[0,136,55]./255
set(gca,'linewidth',2,'FontSize',16)
% xlim([0,5])% strategy
xlim([0,5000])% GPP 

