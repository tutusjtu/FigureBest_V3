function tuBar(axH,iType,iColor)

% 函数功能：控制所有与bar相关的图

if nargin == 0
    axH = gca;
    iType = 1;
    iColor = 42;
end

barList = findobj('Type', 'bar','Parent',axH);
co = choiceColorOrder(iColor)/255;

for  i =1:length(barList)
    switch iType
        case 1
            Bar1(axH,iColor);
            barList(i).LineWidth = 1;
            barList(i).FaceColor = co(mod(i,size(co,1))+1,:);
            barList(i).LineStyle = '-';
            barList(i).EdgeColor = 'w';
        case 2
            Bar2(axH,iColor);
            barList(i).LineWidth = 1.8;
            barList(i).FaceColor = co(mod(i,size(co,1))+1,:);
            barList(i).LineStyle = '-';
            barList(i).EdgeColor = 'k';
        case 3
            Bar3(axH,iColor);
            barList(i).LineWidth = 0.5;
            barList(i).FaceColor = co(mod(i,size(co,1))+1,:);
            barList(i).LineStyle = '-';
            barList(i).EdgeColor = 'w';
    end
    
end
end

%%
function Bar1(axH,iColor)
tuAxes(axH,iColor,'Arial',13,3.5,'none','off','off','bar');
grid off
axH.YMinorTick = 'off';
axH.XMinorTick = 'off';
axH.ZMinorTick = 'off';
axH.XLabel.String='xX label not in LaTeX';
axH.YLabel.String='yY label not in LaTeX';
axH.ZLabel.String='zZ label not in LaTeX';
axH.Title.String='';
end

%%
function Bar2(axH,iColor)
tuAxes(axH,iColor,'Arial',13,1.8,'latex','off','on','bar');
grid on
axH.YMinorTick = 'on';
axH.XMinorTick = 'on';
axH.ZMinorTick = 'off';
axH.XLabel.String='$\bf xX\ {label\ in\ LaTeX}$';
axH.YLabel.String='$\bf yY\ {label\ in\ LaTeX}$';
axH.ZLabel.String='$\bf zZ\ {label\ in\ LaTeX}$';
axH.Title.String='$\bf {Figure\ Title}\  f(x)$';
end

%%
function Bar3(axH,iColor)
tuAxes(axH,iColor,'Arial',13,0.5,'latex','on','off','bar');
grid off
% axH.GridColor = 'w';
axH.YMinorTick = 'off';
axH.XMinorTick = 'off';
axH.ZMinorTick = 'off';
axH.XLabel.String='$\rm xX\ {label\ in\ LaTeX}$';
axH.YLabel.String='$\rm yY\ {label\ in\ LaTeX}$';
axH.ZLabel.String='$\rm zZ\ {label\ in\ LaTeX}$';
axH.Title.String='$\rm {Figure\ Title}\  f(x)$';
end