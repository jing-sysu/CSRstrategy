%% plot scatter function
function [R,p_value]=cor2_strate(data1,data2)
figure;dscatter(data1,data2)
colormap(flipud(slanCM('RdYLBu')))
hold on;

[p,s]=polyfit(data1,data2,1);%多项式曲线拟合
re_sizefact=sort(data1);
[yfit,dy] = polyconf(p,re_sizefact,s,'predopt','curve'); % 多项式的置信区间 % yfit=polyval(p,PHD);
fill([re_sizefact', fliplr(re_sizefact')], [(yfit-dy)', fliplr((yfit+dy)')],[0.6667 0.8176 0.9529], 'linestyle', 'none', 'FaceAlpha',0.5);
line(re_sizefact,yfit,'color',[1,0,0],'LineWidth',2);%[0.1216,0.4667,0.7059]
% line(re_sizefact,yfit-dy,'color',[0 0.4470 0.7410],'linestyle',':');
% line(re_sizefact,yfit+dy,'color',[0 0.4470 0.7410],'linestyle',':');

[R,p_value]=corr(data1,data2,'rows','pairwise');
set(gca,'linewidth',1,'FontSize',16)
box on;