%% ==============================================================================================
%  Function: Specification of CSR ecological strategy types
%  Method adopted from: Pierce, S., et al. A global method for calculating plant CSR ecological
%                       strategies applied across biomes world-wide. Functional Ecology, 31, 444-457,
%                       DOI: 10.1111/1365-2435.12722 (2017)
%
%  Author: Jing Wang
%  Date: 2025/08/08
%% ==============================================================================================
function class_CSR=Step2_StrateFyCalcType% 
[C_stra,Cstra_info]=readgeoraster('C_stra.tif');%('C_stra.tif');
S_stra=imread('S_stra.tif');
R_stra=imread('R_stra.tif');
BN=[90	73	73	48	54	48	42	42	23	33	23	23	23	5	17	5	5	5	5];%C class
CG=[5	5	23	5	23	48	17	42	5	33	73	23	54	5	42	90	23	73	48];%S class
CZ=[5	23	5	48	23	5	42	17	73	33	5	54	23	90	42	5	73	23	48];%R class
nonvalid=isnan(C_stra);
class_CSR=zeros(size(C_stra));
str_var=(C_stra(~nonvalid)-BN).^2+(S_stra(~nonvalid)-CG).^2+(R_stra(~nonvalid)-CZ).^2;%M5=C_stra;N5=S_stra;O5=R_stra;
clear C_stra S_stra R_stra
[~,minind]=min(str_var,[],2);
class_CSR(~nonvalid)=minind;
clear str_var minind

% imagesc(class_CSR)
imAlpha=ones(size(class_CSR,[1,2]));
imAlpha(nonvalid)=0;

geoplot_large(class_CSR,Cstra_info,imAlpha)
hcb = colorbar; 
set(hcb,'XTick',[1:1:19])
hcb.TickLength = 0;  
hcb.XTickLabel={'C','C/CR','C/CS','CR','C/CSR','CS','CR/CSR','CS/CSR','R/CR','CSR','S/CS','R/CSR','S/CSR','R','SR/CSR','S','R/SR','S/SR','SR'};
colormap jet(19);
set(gcf,'Position', [10 10 1200 600]);
set(gca,'FontSize',16)

hc = histcounts(class_CSR(:));
% percent of total for each bar
hc_class = hc ;
hc_class = hc_class / sum(hc_class(2:length(hc_class))) * 100;
y_color = colormap(jet(length(hc_class)));

figure;
hold on
for i = 2:length(hc_class)
    h=bar(i-1,hc_class(i));    
    set(h,'FaceColor',y_color(i,:));    
end
set(gca,'xtick',1:length(hc_class)-1); 
set(gca,'xticklabel',{'C','C/CR','C/CS','CR','C/CSR','CS','CR/CSR','CS/CSR','R/CR','CSR','S/CS','R/CSR','S/CSR','R','SR/CSR','S','R/SR','S/SR','SR'});
ylabel('Frequency (%)');
xlabel('Strategy type');
hold off
set(gca,'linewidth',1,'FontSize',16)
xtickangle(90)
box on