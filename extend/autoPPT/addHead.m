function pres=addHead(pres)
% �������ܣ���һ���Ѿ��򿪵�PPT�����ӵ�һҳ
% pres ����  ���򿪵�PPT
import mlreportgen.ppt.*;
if nargin == 0
    clc;
    disp('��û�д��κ�PPTŶ�����˳���');
    return
end

global isDefault;% �Ƿ�ѡ��Ĭ�ϲ���

%% ��Ҫ���룬���ӱ���

if isDefault(2) == 1
    name1='ͼͨ�����Զ���ģ��';name2='С��ͼͼ����';%Ĭ�ϲ���
else
    disp('========����������ҳ========');
    name1=string(input('������������PPT������: ','s'));%�����ļ���
    name2=string(input('������������PPT�����⣨û�о�ֱ�ӻس���: ','s'));%�����ļ���
end

Head = add(pres, '��ҳ');% �����µ���ҳ
replace(Head,'���� 1', name1);
replace(Head,'������ 2', name2);

pres=pres;

end