%import AVG traj data as "import"
figure
hold off
clf
% figure
plotCount = size(import,2)/2; %11, 12 3x4
for n = 1:size(import,2)/2
    plotArray = zeros(size(import,1),2);
%     plotArray = [];
%     avgTemp = [];
%     tempSize = 0;
%     k=1;
%     while k < size(import(:,2*n-1),1)
%         if import(k,n) == 0
%             tempSize = k-1;
%             k = size(import(:,2*n-1))+1;
%         end
%         k = k+1;
%         if k == size(import(:,2*n-1),1)
%             tempSize = k;
%         end
%     end
%     1 3 5 7 9 11 13 15 17
%     plotArray(:,end+1) = import(1:tempSize,2*n-1);
%     plotArray(:,end+1) = import(1:tempSize,2*n);
    plotArray(:,1) = import(:,2*n-1);
    plotArray(:,2) = import(:,2*n);
    plotArray(find(plotArray(:,2)==0),:) = [];
    plotArray(:,1) = plotArray(:,1) - plotArray(1,1);
    subplot(round(plotCount/2,0),round(plotCount/round(plotCount/2,0),0),n)
    plot(plotArray(:,1),plotArray(:,2))
    xlim([10 90]) 
    ylim([20 80])
    hold on
end


% 150x120mm -> 57600 pixels / 18000 mm^2
% 1 pixel = 3.2 mm^2