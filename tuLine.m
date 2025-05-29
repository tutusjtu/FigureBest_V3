function tuLine(axH,iType,iColor)
% 函数功能：控制所有与线相关的图

if nargin == 0
    axH = gca;
    iType = 1;
    iColor = 42;
end

lineList = findobj('Type', 'line','Parent',axH);
co = choiceColorOrder(iColor)/255;
STYLE = {'-' '--' ':' '-.'};
MARKER = {'o' 'square' 'diamond' '*' '+' '>'};

for  i =1:length(lineList)
    switch iType
        case 1
            Line1(axH,iColor);
            lineList(i).LineWidth = 2.5;
            lineList(i).Color = co(mod(i,size(co,1))+1,:);
            lineList(i).LineStyle = STYLE{mod(i,length(STYLE))+1};
            lineList(i).Marker = MARKER{mod(i,length(MARKER))+1};
        case 2
            Line2(axH,iColor);
            lineList(i).LineWidth = 1.8;
            lineList(i).Color = co(mod(i,size(co,1))+1,:);
            lineList(i).LineStyle = STYLE{mod(i,length(STYLE))+1};
            lineList(i).Marker = MARKER{mod(i,length(MARKER))+1};
        case 3
            Line3(axH,iColor);
            lineList(i).LineWidth = 1;
            lineList(i).Color = co(mod(i,size(co,1))+1,:);
            lineList(i).LineStyle = STYLE{mod(i,length(STYLE))+1};
            lineList(i).Marker = 'none';
    end
    
    
end


end


%%
function Line1(axH,iColor)
tuAxes(axH,iColor,'Arial',13,3.5,'none','off','off','line');
grid off
axH.YMinorTick = 'off';
axH.XMinorTick = 'off';
axH.ZMinorTick = 'off';
axH.XLabel.String='xX label not in LaTeX';
axH.YLabel.String='yY label not in LaTeX';
axH.ZLabel.String='zZ label not in LaTeX';
axH.Title.String='Title f(x) not in LaTeX';
end

%%
function Line2(axH,iColor)
tuAxes(axH,iColor,'Arial',13,2,'latex','off','on','line');
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
function Line3(axH,iColor)
tuAxes(axH,iColor,'Arial',13,0.5,'latex','on','off','line');
grid on
axH.GridColor = 'w';
axH.YMinorTick = 'off';
axH.XMinorTick = 'off';
axH.ZMinorTick = 'off';
axH.XLabel.String='$\rm xX\ {label\ in\ LaTeX}$';
axH.YLabel.String='$\rm yY\ {label\ in\ LaTeX}$';
axH.ZLabel.String='$\rm zZ\ {label\ in\ LaTeX}$';
axH.Title.String='$\rm {Figure\ Title}\  f(x)$';
end

