function handleMyDraw=controlBarLightColor(handleMyDraw,iColor)
%������״ͼ�ĸ�ʽ
% ��ȡɫ��
co=choiceColorOrder(iColor);
handleMyDraw.LineWidth=0.5;
handleMyDraw.EdgeColor='w';
% handleMyDraw.AlignVertexCenters='on';%�񻯱���
%������������������Ӧ��ǰ����ͼ
handleMyDraw.Parent.LineWidth=0.5;
handleMyDraw.Parent.Box='off';
handleMyDraw.Parent.XGrid='on';
handleMyDraw.Parent.YGrid='on';
handleMyDraw.Parent.ZGrid='on';
handleMyDraw.Parent.GridLineStyle='--';
handleMyDraw.Parent.GridAlpha=0.8;%�����ߵ�͸����
handleMyDraw.Parent.GridColor=[1 1 1];
handleMyDraw.Parent.Color=([1 1 1]-co(1,:)/255)*0.8+co(1,:)/255;
handleMyDraw.Parent.FontWeight='normal';%��Ϊ������ϸ
%ͼ��
% handleMyDraw.Parent.Legend.Location='northwest';
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

handletexts=findall(handleMyDraw.Parent.Children,'Type','text');
for i=1:length(handletexts)
    handletexts(i).EdgeColor='none';
    set(handletexts(i),'FontWeight','normal');
end
end