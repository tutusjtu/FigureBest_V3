function handleMyDraw=controlSurfaceBoldNoColor(handleMyDraw,iColor)
%������״ͼ�ĸ�ʽ
%������״ͼ�ĸ�ʽ
% ��ȡɫ��
co=choiceColorOrder(iColor);
handleMyDraw.LineWidth=1;
handleMyDraw.EdgeColor=[0 0 0];
handleMyDraw.AlignVertexCenters='on';%�񻯱���
%������������������Ӧ��ǰ����ͼ
handleMyDraw.Parent.LineWidth=1.5;
handleMyDraw.Parent.Box='on';
handleMyDraw.Parent.XGrid='on';
handleMyDraw.Parent.YGrid='on';
handleMyDraw.Parent.ZGrid='on';
handleMyDraw.Parent.GridLineStyle='--';
handleMyDraw.Parent.GridAlpha=0.2;%�����ߵ�͸����
handleMyDraw.Parent.GridColor=[.2 .2 .2];
handleMyDraw.Parent.Color='w';
handleMyDraw.Parent.FontWeight='bold';%��Ϊ������ϸ
%ͼ��
% handleMyDraw.Parent.Legend.Location='east';
% handleMyDraw.Parent.Legend.Box='off';
% handleMyDraw.Parent.Legend.FontWeight='normal'%��Ϊ������ϸ
%�޸ı�ǩ����(��Ϊ���Ӵְ汾)
%����ô��if��Ϊ�˱���ˢ���Ѿ��е�����
if isempty(handleMyDraw.Parent.XLabel.String)
handleMyDraw.Parent.XLabel.String='$\rm xxxXXX\ {label\ in\ Latex}$';
end
if isempty(handleMyDraw.Parent.YLabel.String)
handleMyDraw.Parent.YLabel.String='$\rm yyyYYY\ {label\ in\ Latex}$';
end
if isempty(handleMyDraw.Parent.ZLabel.String)
handleMyDraw.Parent.ZLabel.String='$\rm zzzZZZ\ {label\ in\ Latex}$';
end
if isempty(handleMyDraw.Parent.Title.String)
handleMyDraw.Parent.Title.String='$\ \rm{Figure\ Title}\  f(x)$';
end
end