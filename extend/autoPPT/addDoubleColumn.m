function pres=addSingleColumn(pres,leftcontent,rightcontent)
% �������ܣ���һ���Ѿ��򿪵�PPT������һ��˫��ҳ��
% pres ����  ���򿪵�PPT
import mlreportgen.ppt.*;
if nargin == 0
    clc;
    disp('��û�д��κ�PPTŶ�����˳���');
    return
elseif nargin == 1
    leftcontent = Paragraph('����û������');
    rightcontent = Paragraph('����û������');
end


global isDefault;% �Ƿ�ѡ��Ĭ�ϲ���

%% ��Ҫ����
title='����˫���ı�����˵��';
slide = add(pres, '˫��');
replace(slide, '���� 1',title);

replace(slide, '����ռλ�� 11',leftcontent);
replace(slide, '����ռλ�� 15',rightcontent);
end