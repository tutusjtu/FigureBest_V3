function zoominout(Num)
%���ڷŴ�ֲ���������
figure(fignum2handle(Num)) 
if length(fignum2handle(Num))==0
    return
end

waitfor(msgbox({'��Step1����ѡ������ȷ�����Ŵ�����򣨾��ζԽ��ߣ�','��Step2����ѡ���������ڷ���λ�ã����ζԽ��ߣ�'},'������ʾ','modal'));
[tempx,tempy]=ginput(2);
ZoomArea=[min(tempx),max(tempx) min(tempy),max(tempy)];

[tempx,tempy]=ginput(2);
InsetPos=[min(tempx),max(tempx) min(tempy),max(tempy)];
Lines={'NW','SW'; 'NE','SE'}
MagInset(gcf, gca, ZoomArea, InsetPos, Lines);
end