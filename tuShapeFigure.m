function figH = tuShapeFigure(iNumber,proportion,resizeType)
% ��������:figure�������ã�������С������
% �������:figure���(�����ֵ���ʽ),Ĭ�ϵ�ǰgcf���������Ƿ�ɵ���С
% proportion: 1 2 3 4
% resizeType: 'on' 'off'

% !!!���û���κ�figure��ֱ���˳�
figH = findobj('Type', 'figure');
if isempty(figH)
    disp('����: ���κ�figure����!')
    return
end

% ��������
if nargin == 0
    iNumber=get(gcf,'Number');
    proportion=1;
    resizeType = 'on';
elseif nargin==1
    proportion=1;
    resizeType = 'on';
elseif nargin==2
    resizeType = 'on';
end
figH = findobj('Type', 'figure','Number',iNumber);
if isempty(figH)
    disp('δ�ҵ�����')
    return
end
% ��ʽ����
figH.Name='ͼͼ�Ļ�ͼ��ʽ�����ں�/Bվ��ͼͨ����';
figH.Units='centimeters'; %��Ϊ����Ϊ��λ
figH.Color='w';
% figH.ToolBar = 'none';
% figH.MenuBar = 'none';
Frame = get(iNumber,'JavaFrame');
set(Frame,'FigureIcon',javax.swing.ImageIcon('tutu.png'));

% ��������
switch proportion
    case 1
        figH.Position=[10, 4, 19, 14.25];% [���λ�� ��ȸ߶�]cm
    case 2
        figH.Position=[10, 10, 9, 6.75];
end

% �Ƿ��С�ɵ�
figH.Resize= resizeType;

% ����������Ĺ����䶼����
axList = findobj('Type', 'axes');
for i = 1:length(axList)
    %axList(i).Toolbar.Visible = 'on';
end
end