% 【功能说明】
% ==========================
% 自动生成一个PPT；
% 可以由空白页面创建，也可以由指定模板创建；
% 可以决定完成后是否打开；
% 【参数说明】
% ==========================
% name —— 保存的PPT名称
% isOpen —— 完成后是否打开
% global isDefault; —— 默认参数是否启用，1是启用
% templatename —— 模板名称


%% 初始化、导入PPT模块
% clear all;
clc;
import mlreportgen.ppt.*;
global isDefault;
global templatename;
global isOpen;

isDefault = [0 1];%分别是文件名、标题的默认设置是否打开
% templatename='sjtu_red.pptx';
% isOpen=0;

%% 保存的名称以及结束后是否打开
if isDefault(1)==1
    name=['图图的自动化模板'];
else
    name=input('请输入需要保存的PPT名称["X"=退出]: ','s');%保存文件名
end

if strcmp(name,'x') | strcmp(name,'X')
    clc;disp('程序已退出！');return
end

%% 模板选择
% 此处的模板要注意选择正规的模板（即母版是完整的）
% =========================================================================
% pres = Presentation('myPresentation','sjtu_red.pptx');%交通大学红色模板）
% pres = Presentation('空白模板');%空白模板
try
    pres = Presentation([pwd,'\Results\',name,'.pptx'],[pwd,'\template\' templatename]);%交通大学蓝色模板）
    open(pres);
catch ErrorInfo
    disp('请关闭同名文件！！')
    errordlg('发生冲突，请关闭某些PPT！');
    return
end


%% 可添加的页面

% * 首页 addHead
% * 单栏 addSingleColumn
% * 双栏 addDoubleColumn
% * 致谢 addThanks

%% 开始处理各个页面
%目前仅支持5张图片

disp('请输入Figure左上角的数字');
disp('【1~5维的行向量，依次排序】')
disp('【示例:[1 2 3]】');
Num = input('请输入：');
if length(Num)<5 & length(Num)>=1
    Num(length(Num)+1:5)=Num(1);
elseif length(Num)<1
    errordlg('没有任何输入Figure')
    return
end

Fig=[];

for i=1:5
    Fig=[Fig;findall(groot,'Type','figure','Number',Num(i))];
end

if length(Fig)~=5
    errordlg('您输入了不存在的Figure!!')
    return
end

iPic=1;%第i张图片
%================================首页================================
pres=addHead(pres);
%================================说明页================================
pres=addSingleColumn(pres);
%================================文字页================================
pres=addSingleColumn(pres,Paragraph('你可以在这里输入大段的文字介绍@TuTu'));
%================================单图页================================
picname{iPic}=num2str(iPic);
saveas(Fig(iPic),[pwd,'\',picname{iPic},'.png']);
pres=addSingleColumn(pres,Picture([pwd,'\',picname{iPic},'.png']));iPic=iPic+1;
%================================双栏左图================================
picname{iPic}=num2str(iPic);
saveas(Fig(iPic),[pwd,'\',picname{iPic},'.png']);
pres=addDoubleColumn(pres,Picture([pwd,'\',picname{iPic},'.png']),Paragraph('这是条目列表说明，你可以输入你想要的一切说明在这里@图通道'));iPic=iPic+1;
%================================双栏右图================================
picname{iPic}=num2str(iPic);
saveas(Fig(iPic),[pwd,'\',picname{iPic},'.png']);
pres=addDoubleColumn(pres,Paragraph('这是条目列表说明，你可以输入你想要的一切说明在这里@图通道'),Picture([pwd,'\',picname{iPic},'.png']));iPic=iPic+1;
%================================双栏双图================================
picname{iPic}=num2str(iPic);
saveas(Fig(iPic),[pwd,'\',picname{iPic},'.png']);iPic=iPic+1;
picname{iPic}=num2str(iPic);
saveas(Fig(iPic),[pwd,'\',picname{iPic},'.png']);iPic=iPic+1;
pres=addDoubleColumn(pres,Picture([pwd,'\',picname{iPic-2},'.png']),Picture([pwd,'\',picname{iPic-1},'.png']));
%================================感谢页================================
Thanks = add(pres, '致谢');


%% 关闭处理！是否打开PPT？
close(pres);clc

for i=1:length(picname)
    delete([pwd '\' picname{i} '.png']);
end

if ispc %判断是否windows系统
    switch isOpen
        case 0
            disp('已完成！');
        case 1
            winopen(erase(pres.OutputPath,[name,'.pptx']));...
                %打开文件所在位置
        case 2
            winopen(pres.OutputPath);%打开文件
        case 3
            winopen(erase(pres.OutputPath,[name,'.pptx']));
            winopen(pres.OutputPath);%同时1&2
    end
end


