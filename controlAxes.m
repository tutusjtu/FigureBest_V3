function handleMyAxes=controlAxes(handleMyAxes,iColor)
if nargin==1
   iColor=4;
end
%% ��ɫ����ColorOrder
% %��ͼɫϵ
% switch iColor
%     case 21
%         co=[255 59 59;7 7 7];%��ɫ�����ͼ
%     case 22
%         co=[254 129 125;129 184 223];%��ɫ������ͼ
%     case 4
%         co=[23 23 23;6 233 6;255 28 0;0 37 255];%��ɫ��ɫ
%     case 3
%         co=[77 133 189;247 144 61;89 169 90];%��ɫ��ɫ
%     case 5
%         co=[1 86 153;250 192 15;243 118 74;95 118 74;95 198 201;79 89 109];%��ɫ��ɫ
%     case 6
%         co=[203 180 123;91 183 205; 71 120 185;84 172 117;197 86 89;117 114 181];%��ɫ��ɫ
%     otherwise
%         disp('ɫ��������,����Ĭ��ֵ')
%         co=[255 59 59;7 7 7];
% end
co=choiceColorOrder(iColor);
set(handleMyAxes,'ColorOrder',co/255,'NextPlot','add');
colormap(handleMyAxes,co/255);
%% ���������
%Latex���������ƺ���֧������
%��д��ǩ�ͱ���
set(handleMyAxes.XLabel,'Interpreter','latex');
set(handleMyAxes.YLabel,'Interpreter','latex');
set(handleMyAxes.ZLabel,'Interpreter','latex');
set(handleMyAxes.Title,'Interpreter','latex');
if isempty(handleMyAxes.XLabel.String)
handleMyAxes.XLabel.String='$\bf xxxXXX\ {label\ in\ Latex}$';
end
if isempty(handleMyAxes.YLabel.String)
handleMyAxes.YLabel.String='$\bf yyyYYY\ {label\ in\ Latex}$';
end
if isempty(handleMyAxes.ZLabel.String)
handleMyAxes.ZLabel.String='$\bf zzzZZZ\ {label\ in\ Latex}$';
end
if isempty(handleMyAxes.Title.String)
handleMyAxes.Title.String='$\ \bf{Figure\ Title}\  f(x)$';%����Ӵ���
end
%�����������ǩ������ֺ�
myFontNameLabel='Arial';
handleMyAxes.XLabel.FontName=myFontNameLabel;
handleMyAxes.YLabel.FontName=myFontNameLabel;
handleMyAxes.ZLabel.FontName=myFontNameLabel;
myFontSizeLabel=12;
handleMyAxes.XLabel.FontSize=myFontSizeLabel;
handleMyAxes.YLabel.FontSize=myFontSizeLabel;
handleMyAxes.ZLabel.FontSize=myFontSizeLabel;
%%����������̶�������ֺ�
myFontName='Arial';
handleMyAxes.FontName=myFontName;
myFontSize=12;
handleMyAxes.FontSize=myFontSize;
handleMyAxes.FontWeight='Bold';
%��������߿�
handleMyAxes.Box='on';
%����������߿��߿�
handleMyAxes.LineWidth=1.5;
%����grid
handleMyAxes.XGrid='on';
handleMyAxes.YGrid='on';
handleMyAxes.ZGrid='on';
handleMyAxes.GridLineStyle='--';
%С�̶�
handleMyAxes.XMinorTick='on';
handleMyAxes.YMinorTick='on';
handleMyAxes.ZMinorTick='on';
%hold on����
handleMyAxes.NextPlot='add';
%����Ч��
%handleMyAxes.AmbientLightColor='w';
%% ͼ������������
%Legendͼ��
%����Legend���
% if size(handleMyAxes.Legend,1)==0
    handleLegend=legend(handleMyAxes,'show');
% else
%     handleLegend=handleMyAxes.Legend;
%     disp('ע�⣡���β���ͼ���Ƿ���Ӱ��');
% end
controlLegend(handleLegend);
end