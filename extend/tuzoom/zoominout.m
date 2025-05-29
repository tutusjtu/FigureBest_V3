function zoominout(Num)
%用于放大局部的主函数
figure(fignum2handle(Num)) 
if length(fignum2handle(Num))==0
    return
end

waitfor(msgbox({'【Step1】先选两个点确定被放大的区域（矩形对角线）','【Step2】再选两个点用于放置位置（矩形对角线）'},'操作提示','modal'));
[tempx,tempy]=ginput(2);
ZoomArea=[min(tempx),max(tempx) min(tempy),max(tempy)];

[tempx,tempy]=ginput(2);
InsetPos=[min(tempx),max(tempx) min(tempy),max(tempy)];
Lines={'NW','SW'; 'NE','SE'}
MagInset(gcf, gca, ZoomArea, InsetPos, Lines);
end