function handleMyDraw=controlLineLightColor(handleMyDraw,myLineType,myMarkerType,myco,iColor)
%% ���������ĸ�ʽ
handleMyDraw.Color=myco;
handleMyDraw.LineWidth=1;
handleMyDraw.MarkerSize=5;
handleMyDraw.LineStyle=myLineType;
handleMyDraw.Marker='none';
handleMyDraw.MarkerFaceColor='none';
%% ������������������Ӧ��ǰ����ͼ
handleMyDraw.Parent.LineWidth=0.5;
handleMyDraw.Parent.Box='off';
handleMyDraw.Parent.XGrid='on';
handleMyDraw.Parent.YGrid='on';
handleMyDraw.Parent.ZGrid='on';
handleMyDraw.Parent.GridLineStyle='--';
handleMyDraw.Parent.GridAlpha=0.8;%�����ߵ�͸����
handleMyDraw.Parent.GridColor=[1 1 1];
co=choiceColorOrder(iColor);
handleMyDraw.Parent.Color=([1 1 1]-co(1,:)/255)*0.9+co(1,:)/255;
handleMyDraw.Parent.FontWeight='normal';%��Ϊ������ϸ
%% ͼ��
% handleMyDraw.Parent.Legend.Location='northeast';
% handleMyDraw.Parent.Legend.FontWeight='normal'%��Ϊ������ϸ
% handleMyDraw.Parent.Legend.LineWidth=0.5;
% handleMyDraw.Parent.Legend.Color='none';
% handleMyDraw.Parent.Legend.EdgeColor='none';
end