function figH = tuShapeFigure(iNumber,proportion,resizeType)
% 函数功能:figure窗口设置，包括大小等属性
% 输入参数:figure句柄(以数字的形式),默认当前gcf；比例；是否可调大小
% proportion: 1 2 3 4
% resizeType: 'on' 'off'

% !!!如果没有任何figure，直接退出
figH = findobj('Type', 'figure');
if isempty(figH)
    disp('警告: 无任何figure存在!')
    return
end

% 函数重载
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
    disp('未找到！！')
    return
end
% 样式控制
figH.Name='图图的绘图格式（公众号/B站：图通道）';
figH.Units='centimeters'; %改为厘米为单位
figH.Color='w';
% figH.ToolBar = 'none';
% figH.MenuBar = 'none';
Frame = get(iNumber,'JavaFrame');
set(Frame,'FigureIcon',javax.swing.ImageIcon('tutu.png'));

% 比例控制
switch proportion
    case 1
        figH.Position=[10, 4, 19, 14.25];% [相对位置 宽度高度]cm
    case 2
        figH.Position=[10, 10, 9, 6.75];
end

% 是否大小可调
figH.Resize= resizeType;

% 所有坐标轴的工具箱都保留
axList = findobj('Type', 'axes');
for i = 1:length(axList)
    %axList(i).Toolbar.Visible = 'on';
end
end