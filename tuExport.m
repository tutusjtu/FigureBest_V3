function picPath = tuExport(figH,picName,format,pasteMode)
% 函数功能：导出图形
% 参数说明：figure句柄，图片名，格式，是否复制到剪切板
% 返回值：保存的图片路径
% format ： '-dtiff' '-dpng' '-djpeg' '-depsc'
% pasteMode：'on' 'off'
% 
%
oldPath = pwd; % 记录当前路径
mkdir(pwd,'Results'); %生成图片目录
cd([pwd,'\Results']); %切换图片目录

switch nargin
    case 0
        figH = gcf;
        picName = 'tutuPic_';
        format = '-dtiff';
        pasteMode = 'off';
    case 1
        picName = 'tutuPic_' ;
        format = '-dtiff';
        pasteMode = 'off';
    case 2
        format = '-dtiff';
        pasteMode = 'off';
    case 3
        pasteMode = 'off';
end

% 图片名，由系统时间保证唯一性
picName = [picName datestr(now,'yyyymmddTHHMMSS')] ;

% 不变的样式
figH.PaperType = 'a4'; % 设置标准页面大小
figH.PaperPositionMode = 'auto';% 打印或保存的图窗大小与显示的图窗大小相匹配
figH.InvertHardcopy = 'off'; % 保存或打印时使用与所显示颜色相同的颜色

% 导出的图片格式
if strcmp(format,'-depsc')
    figH.Renderer = 'painters'; % 'painters'为矢量渲染，'opengl'为位图渲染器
    print(figH,format,picName);
    picPath = [pwd '\' picName '.eps']; % 返回生成的图片路径
else
    figH.Renderer = 'opengl';
    print(figH,format,picName,'-r800');
    picPath = [pwd '\' picName '.' format(3:end)]; % 返回生成的图片路径
end

% 是否复制到剪切板
if strcmp(pasteMode,'on')
    print('-clipboard','-dmeta');
end
fid = fopen('name_append.txt','w+');
        fprintf(fid,'%s\n',picName);
fclose(fid);
% 改回路径
cd(oldPath);


