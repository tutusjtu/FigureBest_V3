function handleLegend=modifyLegend(iNumber,isVisible,myFontSize)
%%  �ڸ���figure���޸�һ��ͼ������ʽ���ҿ��Կ���ͼ���Ƿ���ʾ
%   iNumber��ͼƬ���Ͻǵ�����
%   ���Խ��޸�ͼ����һЩ��Ϣ����������ڣ����Զ�*����һ������ѡ��
%   ��figure����������ָ����ͼ��
%   ֻ�޸�ͼ���������޸�����ֵ
if nargin==0
    iNumber=get(gcf,'Number');
    isVisible='on';
    myFontSize=10;
elseif  nargin==1
    isVisible='on';
    myFontSize=12;
elseif nargin==2
    myFontSize=12;
end
handleFigure=findobj('Type', 'figure','Number',iNumber);

%% ������Ҫ������ͼ����������û�о��Ƿ��ش�����ľ����
handleLegend=modifyLegendRecognize(handleFigure)%���������

%% ��Legend����ϸ�ٿ�
%
%����ͼ�����Ų���ʽ
%��������ͼ����λ�������figure�����������axes�ģ�������
handleLegend.Location='northeast';      %ͼ����λ
handleLegend.Orientation='vertical';    %ͼ����ֱ�Ų�
handleLegend.NumColumns=1;              %ͼ������
%handleLegend.Position(3)=0.1;          %ֻ�ı�ͼ�����
handleLegend.FontName='Arial';
handleLegend.FontSize=myFontSize;
handleLegend.LineWidth=0.5;
handleLegend.Box='on';
handleLegend.Visible=isVisible;
shg
end
