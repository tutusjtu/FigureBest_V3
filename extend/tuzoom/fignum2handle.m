function figHandle=fignum2handle(figNum)
%%	�˺�����ͼ�����Ͻǵ�����ת��Ϊͼ�ξ�����
%	function figHandle=figNumtofigHandle(figNum)
%   figNum�Ǳ�������
%   
if nargin==0 & ~isempty(get(groot,'CurrentFigure'))
    figHandle=gcf;
    warning('δ�ҵ�ͼƬ���������ĵ�ǰͼƬ');
    return
elseif nargin==0 & isempty(get(groot,'CurrentFigure'))
    warndlg('�������κ�ͼƬ!');
    return
end

%% ��Ҫ�ĳ������
figHandle=findall(groot,'Type','figure','Number',figNum);
if isempty(figHandle)
    warndlg('δ�ҵ�!');
    figHandle.delete;
end
end