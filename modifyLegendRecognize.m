function handleLegend=modifyLegendRecognize(handleFigure)
% function handleLegend=modifyLegendRecognize(handleFigure)
% ����ͼ�ξ������ȱʡ
% �ƺ�������������iNumber�ȼ�
if nargin==0
    handleFigure=gcf;
end

%% ���ָ��ͼ���ľ��
%   ��ȡFigure(���handleFigure)�е�ָ��ͼ��..
%   �������
handleMyAxes=findobj(get(handleFigure,'Children'),'flat','Type','axes');
handleLegend=findobj(get(handleFigure,'Children'),'flat','Type','Legend');
if  isempty(handleMyAxes)
    disp('û��axes')
    return
elseif  length(handleMyAxes)>1
    
    msgbox('���С�5���ӡ�ʱ�䵥��Ŀ��������');
    pause(6)
    if ~strcmp(get(gco,'Type'),'axes')
        
    msgbox('ѡ�����������ѡ��');
    return
    end
end


handleMyAxes=gca;

handleLegend=legend(handleMyAxes,'show');

if isempty(handleLegend)
    handleLegend=legend(handleMyAxes,'show');
    disp('ͼ����legend���Ѵ���');
end
%%
%     myProperty=input('������Ŀ��ͼ��������,��һ�ж���Ԫ���������ʽ{'',''}: ');
%     handleLegend=findobj(get(handleFigure,'Children'),'flat','Type','Legend','String',myProperty);
%     if length(handleLegend)~=1
%         disp('���ظ�Legend�������޷��Զ�ʶ�����˳�������Ϊ�޸�ͼ��������֤Ψһ��')
%         handleLegend=handleLegend(1);
%         return;
%     end
% elseif isempty(handleLegend)
%     disp('ͼ����legend����Ҫ����');
%
%     if length(handleMyAxes)>1
%         ihandleMyAxes=input('�����봴��ͼ������������ţ� ');
%     else
%         ihandleMyAxes=1;
%     end
%     if ihandleMyAxes>length(handleMyAxes)
%         disp('û�����������,�˳�����')
%         return
%     end
%
%     gca=handleMyAxes(ihandleMyAxes)
%     handleLegend=legend(gca);
% end
%�ر����жԻ���
close(findall(0,'tag','Msgbox_ '));
end