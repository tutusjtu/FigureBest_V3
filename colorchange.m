function [iColorOrder,iColorMap]=colorchange(figNum,iColorOrder,iColorMap)
%% 更改配色方案
if nargin==2
    iColorMap=iColorOrder;
elseif nargin==1
    iColorOrder=42;
    iColorMap=42;
end

figHandle=fignum2handle(figNum);
axesHandles=findall(figHandle,'Type','axes');

myColorOrder=choiceColorOrder(iColorOrder)/255;

for i=1:length(axesHandles)
    axesHandles(i).ColorOrder = repmat(myColorOrder,20,1);
    colormap(axesHandles(i),myColorOrder);    
end

% 针对surf绘制出的图片调整Colormap
% surfacelist = findobj(figNum,'Type','surface')
% if ~isempty(surfacelist)
%     temp = zeros(100,3);
%     
%     myColorMap=choiceColorOrder(iColorMap)/255;
%     temp(:,1) = linspace(myColorMap(1,1),myColorMap(end,1),100)';
%     temp(:,2) = linspace(myColorMap(1,2),myColorMap(end,2),100)';
%     temp(:,3) = linspace(myColorMap(1,3),myColorMap(end,3),100)';
%     myColorMap = temp;
%     
%     for i =1:length(surfacelist)
%         colormap(surfacelist(i).Parent,myColorMap);
%     end
% end

shg

end