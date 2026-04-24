function geoplot_large(img,img_info,imAlpha)% for large image
figure

lat = linspace(img_info.LatitudeLimits(2), img_info.LatitudeLimits(1), size(img,1));
lon = linspace(-180, 180, size(img,2));
imagesc(lon, lat, img,'AlphaData',imAlpha)
set(gca, 'YDir', 'normal')
set(gca, 'XAxisLocation','top')
colorbar

hold on
load coastlines
plot(coastlon, coastlat, 'color',[0.5,0.5,0.5], 'LineWidth', 1)

grid on

% set(gca,'xticklabel',{[]})
% set(gca,'yticklabel',{[]})
% set(gcf,'Position', [10 10 1200 600]);