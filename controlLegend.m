function handleLegend=controlLegend(handleLegend,isVisible)
if nargin==1
    isVisible='on';
end
%����ͼ�����Ų���ʽ    
%��������ͼ����λ�������figure�����������axes�ģ�������
handleLegend.Location='northeast';      %ͼ����λ
handleLegend.Orientation='vertical';    %ͼ����ֱ�Ų�
% handleLegend.NumColumns=1;              %ͼ������
%handleLegend.Position(3)=0.1;          %ֻ�ı�ͼ�����
handleLegend.FontName='Arial';
handleLegend.FontSize=12;
handleLegend.LineWidth=1.5;
handleLegend.Box='on';
handleLegend.Visible=isVisible;
return
end