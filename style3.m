function style3(iNumber,idrawType,iColor)
%% ȫ�ֱ���
global isOut;                    %�Ƿ����ͼƬ
global name;        %���ͼƬ����
global iColor;                  %ѡ��ColorOrderɫϵ
global Dimention;                %ѡ��2/3ά�Ȼ�ͼ
global idrawType                %�Ժ��ַ���ͼ1,2,3...
%...........................%������
axesList = findobj('Type', 'axes','Parent',iNumber);

for i =1:length(axesList)
    tuLine(axesList(i),idrawType-2,iColor);
    tuBar(axesList(i),idrawType-2,iColor);    
end

tuShapeFigure(iNumber,1,'on');


if isOut==1
picPath = tuExport(iNumber,name,'-dtiff','off');

end


if isOut==1
    disp('�����!�ѱ���ͼƬ��');
else
    disp('�����!δ���棡');
end


end