function axH = tuAxes(axH,iColor,fontname,fontsize,linewidth,pretermode,fillmode,boxmode,plottype)

switch nargin
    case 0
        axH = gca;
        iColor = 4;
        fontname = 'Times';
        fontsize = 15;
        linewidth = 2.5;
        pretermode = 'latex';
        fillmode = 'off';
        boxmode = 'off';
        plottype = 'line';
    case 1
        iColor = 4;
        fontname = 'Times';
        fontsize = 15;
        linewidth = 2.5;
        pretermode = 'latex';
        fillmode = 'off';
        boxmode = 'on';
        plottype = 'line';
    case 2
        fontname = 'Times';
        fontsize = 15;
        linewidth = 2.5;
        pretermode = 'latex';
        fillmode = 'off';
        boxmode = 'on';
        plottype = 'line';
    case 3
        fontsize = 15;
        linewidth = 2.5;
        pretermode = 'latex';
        fillmode = 'off';
        boxmode = 'on';
        plottype = 'line';
    case 4
        linewidth = 2.5;
        pretermode = 'latex';
        fillmode = 'off';
        boxmode = 'on';
        plottype = 'line';
    case 5
        pretermode = 'latex';
        fillmode = 'off';
        boxmode = 'on';
        plottype = 'line';
    case 6
        fillmode = 'off';
        boxmode = 'on';
        plottype = 'line';
    case 7
        boxmode = 'on';
        plottype = 'line';
    case 7
        plottype = 'line';
        
end

co = choiceColorOrder(iColor); % 选择色卡
set(axH,'ColorOrder',co/255,'NextPlot','add','ColorOrderIndex',ceil(100*rand));

% 坐标轴参数______________________________________________

% 书写标签和标题
set(axH.XLabel,'Interpreter',pretermode);% Latex解释器中似乎不支持中文
set(axH.YLabel,'Interpreter',pretermode);
set(axH.ZLabel,'Interpreter',pretermode);
set(axH.Title,'Interpreter',pretermode);

% 设置坐标轴标签字体和字号
myFontName = fontname;
axH.XLabel.FontName = myFontName;
axH.YLabel.FontName = myFontName;
axH.ZLabel.FontName = myFontName;
axH.Title.FontName = myFontName;
%
myFontSize = fontsize;
%
axH.XLabel.FontSize = myFontSize;
axH.YLabel.FontSize = myFontSize;
axH.ZLabel.FontSize = myFontSize;
% 设置坐标轴刻度的情况
axH.FontName = myFontName;
axH.FontSize = myFontSize;
axH.FontWeight='bold';
axH.Title.FontWeight='bold';
%打开坐标轴边框
axH.Box='on';
%设置坐标轴边框线宽
axH.LineWidth = linewidth;
%设置grid
axH.XGrid='off';
axH.YGrid='off';
axH.ZGrid='off';
axH.GridLineStyle='--';
%小刻度
axH.XMinorTick = 'on';
axH.YMinorTick = 'on';
axH.ZMinorTick = 'on';

% 增加坐标区文字
% if isempty(axH.XLabel.String)
%     axH.XLabel.String='$\bf xX\ {label\ in\ LaTeX}$';
% end
% if isempty(axH.YLabel.String)
%     axH.YLabel.String='$\bf yY\ {label\ in\ LaTeX}$';
% end
% if isempty(axH.ZLabel.String)
%     axH.ZLabel.String='$\bf zZ\ {label\ in\ LaTeX}$';
% end
% if isempty(axH.Title.String)
%     axH.Title.String='$\bf {Figure\ Title}\  f(x)$';%标题加粗了
% end

if strcmp(fillmode,'on')
    NUM = randperm(size(co,1));NUM = NUM(1);
    axH.Color = ([1 1 1]-co(NUM,:)/255)*0.92+co(NUM,:)/255;
    grid on
else
    axH.Color = 'w';
    grid off
end

% 刻度是在框里还是框外
if strcmp(boxmode,'on')
    axH.Box = 'on';
    axH.TickDir = 'in';
else
    axH.Box = 'off';
    axH.TickDir = 'out';
end

% 显示图例
legH = legend(axH,'show');

legH.FontSize = fontsize;
legH.LineWidth = linewidth;
legH.FontName = fontname;
legH.Interpreter = pretermode;
legH.FontWeight='bold';
legH.Location = 'northeast';
legH.Orientation = 'vertical';

if strcmp(plottype,'bar')
    
    legH.FontSize = fontsize-2;
    if linewidth>2
        legH.EdgeColor = 'none';
        legH.Color = 'none';
        legH.Orientation ='horizontal';
        legH.Location = 'northOutside';
    elseif linewidth>1
        legH.EdgeColor = 'k';
        legH.Color = 'w';
        legH.Orientation ='vertical';
        legH.Location = 'northeast';
    elseif linewidth<=1
        legH.EdgeColor = 'k';
        legH.Color = 'w';
        legH.FontWeight='normal';
        axH.FontWeight='normal';
        axH.Title.FontWeight='normal';
        legH.Orientation ='vertical';
        legH.Location = 'northeast';
    end
end

if strcmp(plottype,'line')
    if linewidth>2
        legH.EdgeColor = 'none';
        legH.Color = 'none';
        legH.Location = 'southwest';
        legH.Orientation ='horizontal';
    elseif linewidth>1
        legH.EdgeColor = 'k';
        legH.Color = 'w';
        legH.Location = 'northeast';
        legH.Orientation ='vertical';
    elseif linewidth<=1
        legH.EdgeColor = 'k';
        legH.Color = 'w';
        legH.Location = 'northeast';
        legH.Orientation ='vertical';
        legH.FontWeight='normal';
        axH.FontWeight='normal';
        axH.Title.FontWeight='normal';
    end
end

end