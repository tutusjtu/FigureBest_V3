function picPath = tuExport(figH,picName,format,pasteMode)
% �������ܣ�����ͼ��
% ����˵����figure�����ͼƬ������ʽ���Ƿ��Ƶ����а�
% ����ֵ�������ͼƬ·��
% format �� '-dtiff' '-dpng' '-djpeg' '-depsc'
% pasteMode��'on' 'off'
% 
%
oldPath = pwd; % ��¼��ǰ·��
mkdir(pwd,'Results'); %����ͼƬĿ¼
cd([pwd,'\Results']); %�л�ͼƬĿ¼

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

% ͼƬ������ϵͳʱ�䱣֤Ψһ��
picName = [picName datestr(now,'yyyymmddTHHMMSS')] ;

% �������ʽ
figH.PaperType = 'a4'; % ���ñ�׼ҳ���С
figH.PaperPositionMode = 'auto';% ��ӡ�򱣴��ͼ����С����ʾ��ͼ����С��ƥ��
figH.InvertHardcopy = 'off'; % ������ӡʱʹ��������ʾ��ɫ��ͬ����ɫ

% ������ͼƬ��ʽ
if strcmp(format,'-depsc')
    figH.Renderer = 'painters'; % 'painters'Ϊʸ����Ⱦ��'opengl'Ϊλͼ��Ⱦ��
    print(figH,format,picName);
    picPath = [pwd '\' picName '.eps']; % �������ɵ�ͼƬ·��
else
    figH.Renderer = 'opengl';
    print(figH,format,picName,'-r800');
    picPath = [pwd '\' picName '.' format(3:end)]; % �������ɵ�ͼƬ·��
end

% �Ƿ��Ƶ����а�
if strcmp(pasteMode,'on')
    print('-clipboard','-dmeta');
end
fid = fopen('name_append.txt','w+');
        fprintf(fid,'%s\n',picName);
fclose(fid);
% �Ļ�·��
cd(oldPath);


