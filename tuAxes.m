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

co = choiceColorOrder(iColor); % ѡ��ɫ��
set(axH,'ColorOrder',co/255,'NextPlot','add','ColorOrderIndex',ceil(100*rand));

% ���������______________________________________________

% ��д��ǩ�ͱ���
set(axH.XLabel,'Interpreter',pretermode);% Latex���������ƺ���֧������
set(axH.YLabel,'Interpreter',pretermode);
set(axH.ZLabel,'Interpreter',pretermode);
set(axH.Title,'Interpreter',pretermode);

% �����������ǩ������ֺ�
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
% ����������̶ȵ����
axH.FontName = myFontName;
axH.FontSize = myFontSize;
axH.FontWeight='bold';
axH.Title.FontWeight='bold';
%��������߿�
axH.Box='on';
%����������߿��߿�
axH.LineWidth = linewidth;
%����grid
axH.XGrid='off';
axH.YGrid='off';
axH.ZGrid='off';
axH.GridLineStyle='--';
%С�̶�
axH.XMinorTick = 'on';
axH.YMinorTick = 'on';
axH.ZMinorTick = 'on';

% ��������������
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
%     axH.Title.String='$\bf {Figure\ Title}\  f(x)$';%����Ӵ���
% end

if strcmp(fillmode,'on')
    NUM = randperm(size(co,1));NUM = NUM(1);
    axH.Color = ([1 1 1]-co(NUM,:)/255)*0.92+co(NUM,:)/255;
    grid on
else
    axH.Color = 'w';
    grid off
end

% �̶����ڿ��ﻹ�ǿ���
if strcmp(boxmode,'on')
    axH.Box = 'on';
    axH.TickDir = 'in';
else
    axH.Box = 'off';
    axH.TickDir = 'out';
end

% ��ʾͼ��
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