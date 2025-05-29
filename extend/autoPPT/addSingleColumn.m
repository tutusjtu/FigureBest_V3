function pres=addSingleColumn(pres,content)
% 函数功能：在一个已经打开的PPT中增加一个单栏页面
% pres ——  所打开的PPT
import mlreportgen.ppt.*;
if nargin == 0
    clc;
    disp('你没有打开任何PPT哦！已退出！');
    return
elseif nargin == 1
    content={ ...
    '自动生成一个新的PPT文件' ...
    '可选功能：自动美化你在MATLAB里绘制的数据图' ...
    '自动将数据图插入PPT中' ...
    '*重点关注：是否有figure窗口？是否关闭上次运行创建的PPT？'...
    '**代码比较初步，如有不足之处尽请见谅'};
end

global isDefault;% 是否选择默认参数

%% 主要代码
title='这是单栏的标题与说明';
slide = add(pres, '单栏');
replace(slide, '标题 4',title);
replace(slide, '内容占位符 2',content);
end