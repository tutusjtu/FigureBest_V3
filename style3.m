function style3(iNumber,idrawType,iColor)
%% 全局变量
global isOut;                    %是否输出图片
global name;        %输出图片名称
global iColor;                  %选择ColorOrder色系
global Dimention;                %选择2/3维度绘图
global idrawType                %以何种风格绘图1,2,3...
%...........................%更新中
axesList = findobj('Type', 'axes','Parent',iNumber);

for i =1:length(axesList)
    tuLine(axesList(i),idrawType-2,iColor);
    tuBar(axesList(i),idrawType-2,iColor);    
end

tuShapeFigure(iNumber,1,'on');


if isOut==1
picPath = tuExport(iNumber,name,'-dtiff','off');

end


if isOut==1
    disp('已完成!已保存图片！');
else
    disp('已完成!未保存！');
end


end