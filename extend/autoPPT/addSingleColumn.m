function pres=addSingleColumn(pres,content)
% �������ܣ���һ���Ѿ��򿪵�PPT������һ������ҳ��
% pres ����  ���򿪵�PPT
import mlreportgen.ppt.*;
if nargin == 0
    clc;
    disp('��û�д��κ�PPTŶ�����˳���');
    return
elseif nargin == 1
    content={ ...
    '�Զ�����һ���µ�PPT�ļ�' ...
    '��ѡ���ܣ��Զ���������MATLAB����Ƶ�����ͼ' ...
    '�Զ�������ͼ����PPT��' ...
    '*�ص��ע���Ƿ���figure���ڣ��Ƿ�ر��ϴ����д�����PPT��'...
    '**����Ƚϳ��������в���֮���������'};
end

global isDefault;% �Ƿ�ѡ��Ĭ�ϲ���

%% ��Ҫ����
title='���ǵ����ı�����˵��';
slide = add(pres, '����');
replace(slide, '���� 4',title);
replace(slide, '����ռλ�� 2',content);
end