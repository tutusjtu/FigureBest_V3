function pres=addSingleColumn(pres,leftcontent,rightcontent)
% 函数功能：在一个已经打开的PPT中增加一个双栏页面
% pres ——  所打开的PPT
import mlreportgen.ppt.*;
if nargin == 0
    clc;
    disp('你没有打开任何PPT哦！已退出！');
    return
elseif nargin == 1
    leftcontent = Paragraph('这里没有内容');
    rightcontent = Paragraph('这里没有内容');
end


global isDefault;% 是否选择默认参数

%% 主要代码
title='这是双栏的标题与说明';
slide = add(pres, '双栏');
replace(slide, '标题 1',title);

replace(slide, '内容占位符 11',leftcontent);
replace(slide, '内容占位符 15',rightcontent);
end