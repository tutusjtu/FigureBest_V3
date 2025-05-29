function pres=addHead(pres)
% 函数功能：在一个已经打开的PPT中增加第一页
% pres ——  所打开的PPT
import mlreportgen.ppt.*;
if nargin == 0
    clc;
    disp('你没有打开任何PPT哦！已退出！');
    return
end

global isDefault;% 是否选择默认参数

%% 主要代码，增加标题

if isDefault(2) == 1
    name1='图通道的自动化模板';name2='小编图图制作';%默认参数
else
    disp('========现在设置首页========');
    name1=string(input('【主】请输入PPT主标题: ','s'));%保存文件名
    name2=string(input('【副】请输入PPT副标题（没有就直接回车）: ','s'));%保存文件名
end

Head = add(pres, '首页');% 创建新的首页
replace(Head,'标题 1', name1);
replace(Head,'副标题 2', name2);

pres=pres;

end