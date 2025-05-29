% ������˵����
% ==========================
% �Զ�����һ��PPT��
% �����ɿհ�ҳ�洴����Ҳ������ָ��ģ�崴����
% ���Ծ�����ɺ��Ƿ�򿪣�
% ������˵����
% ==========================
% name ���� �����PPT����
% isOpen ���� ��ɺ��Ƿ��
% global isDefault; ���� Ĭ�ϲ����Ƿ����ã�1������
% templatename ���� ģ������


%% ��ʼ��������PPTģ��
% clear all;
clc;
import mlreportgen.ppt.*;
global isDefault;
global templatename;
global isOpen;

isDefault = [0 1];%�ֱ����ļ����������Ĭ�������Ƿ��
% templatename='sjtu_red.pptx';
% isOpen=0;

%% ����������Լ��������Ƿ��
if isDefault(1)==1
    name=['ͼͼ���Զ���ģ��'];
else
    name=input('��������Ҫ�����PPT����["X"=�˳�]: ','s');%�����ļ���
end

if strcmp(name,'x') | strcmp(name,'X')
    clc;disp('�������˳���');return
end

%% ģ��ѡ��
% �˴���ģ��Ҫע��ѡ�������ģ�壨��ĸ���������ģ�
% =========================================================================
% pres = Presentation('myPresentation','sjtu_red.pptx');%��ͨ��ѧ��ɫģ�壩
% pres = Presentation('�հ�ģ��');%�հ�ģ��
try
    pres = Presentation([pwd,'\Results\',name,'.pptx'],[pwd,'\template\' templatename]);%��ͨ��ѧ��ɫģ�壩
    open(pres);
catch ErrorInfo
    disp('��ر�ͬ���ļ�����')
    errordlg('������ͻ����ر�ĳЩPPT��');
    return
end


%% ����ӵ�ҳ��

% * ��ҳ addHead
% * ���� addSingleColumn
% * ˫�� addDoubleColumn
% * ��л addThanks

%% ��ʼ�������ҳ��
%Ŀǰ��֧��5��ͼƬ

disp('������Figure���Ͻǵ�����');
disp('��1~5ά������������������')
disp('��ʾ��:[1 2 3]��');
Num = input('�����룺');
if length(Num)<5 & length(Num)>=1
    Num(length(Num)+1:5)=Num(1);
elseif length(Num)<1
    errordlg('û���κ�����Figure')
    return
end

Fig=[];

for i=1:5
    Fig=[Fig;findall(groot,'Type','figure','Number',Num(i))];
end

if length(Fig)~=5
    errordlg('�������˲����ڵ�Figure!!')
    return
end

iPic=1;%��i��ͼƬ
%================================��ҳ================================
pres=addHead(pres);
%================================˵��ҳ================================
pres=addSingleColumn(pres);
%================================����ҳ================================
pres=addSingleColumn(pres,Paragraph('����������������ε����ֽ���@TuTu'));
%================================��ͼҳ================================
picname{iPic}=num2str(iPic);
saveas(Fig(iPic),[pwd,'\',picname{iPic},'.png']);
pres=addSingleColumn(pres,Picture([pwd,'\',picname{iPic},'.png']));iPic=iPic+1;
%================================˫����ͼ================================
picname{iPic}=num2str(iPic);
saveas(Fig(iPic),[pwd,'\',picname{iPic},'.png']);
pres=addDoubleColumn(pres,Picture([pwd,'\',picname{iPic},'.png']),Paragraph('������Ŀ�б�˵�����������������Ҫ��һ��˵��������@ͼͨ��'));iPic=iPic+1;
%================================˫����ͼ================================
picname{iPic}=num2str(iPic);
saveas(Fig(iPic),[pwd,'\',picname{iPic},'.png']);
pres=addDoubleColumn(pres,Paragraph('������Ŀ�б�˵�����������������Ҫ��һ��˵��������@ͼͨ��'),Picture([pwd,'\',picname{iPic},'.png']));iPic=iPic+1;
%================================˫��˫ͼ================================
picname{iPic}=num2str(iPic);
saveas(Fig(iPic),[pwd,'\',picname{iPic},'.png']);iPic=iPic+1;
picname{iPic}=num2str(iPic);
saveas(Fig(iPic),[pwd,'\',picname{iPic},'.png']);iPic=iPic+1;
pres=addDoubleColumn(pres,Picture([pwd,'\',picname{iPic-2},'.png']),Picture([pwd,'\',picname{iPic-1},'.png']));
%================================��лҳ================================
Thanks = add(pres, '��л');


%% �رմ����Ƿ��PPT��
close(pres);clc

for i=1:length(picname)
    delete([pwd '\' picname{i} '.png']);
end

if ispc %�ж��Ƿ�windowsϵͳ
    switch isOpen
        case 0
            disp('����ɣ�');
        case 1
            winopen(erase(pres.OutputPath,[name,'.pptx']));...
                %���ļ�����λ��
        case 2
            winopen(pres.OutputPath);%���ļ�
        case 3
            winopen(erase(pres.OutputPath,[name,'.pptx']));
            winopen(pres.OutputPath);%ͬʱ1&2
    end
end


