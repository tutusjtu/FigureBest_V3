function axesfillfigure(figNum)
%% �Ŵ�ѿ�������������������figure����
%% �������һ����
% ����ʽ����
%   �ο������ĵ��������ͼʱ�����ܼ��ٿհױ߾ࡰ
if nargin==0
figNum=get(get(groot,'CurrentFigure'),'Number');
warning('δ�ҵ�ͼƬ���������ĵ�ǰͼƬ');
end
figHandle=fignum2handle(figNum);
axesHandle=findall(figHandle,'Type','axes');
if isempty(axesHandle)
    return
end
%% ��Ҫ����
for iaxesHandle=1:length(axesHandle)

ax = axesHandle(iaxesHandle);
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = (outerpos(1) + ti(1))*1.2;
bottom = (outerpos(2) + ti(2))*1;
ax_width = (outerpos(3) - ti(1) - ti(3))*1;
ax_height = (outerpos(4) - ti(2) - ti(4));
ax.Position = [left bottom ax_width ax_height];
shg
end
end
