function h = cplot(varargin)

% 函数功能：将曲线与X轴围城的区域进行涂色
% 函数重载规则（类似plot函数）：
% cplot(Y);
% cplot(X,Y);
% cplot(X,Y,S);
% cplot(X1,Y1,X2,Y2,...);
% cplot(X1,Y1,S1,X2,Y2,S2,...);
% cplot(ax,__);
% cplot(__,'Name','Value');
%     - 'FillColor' :指定颜色
%     - 'FillAlpha' :指定透明度

names = {'FillType','FillColor','FillAlpha'};

fp = cell(1,3);

for n = 1:length(names)
    for i = 1:length(varargin)
        if strcmpi(names{n},varargin{i})
            if i+1 > nargin
                error(['Expected an input value after the name ' names{i}]);
            end
            fp{n} = varargin{i+1};
            varargin(i:i+1) = [];
            break;
        end
    end
end

if isscalar(varargin{1}) && ishandle(varargin{1}(1))
    ax = varargin{1};
else
    ax = gca;
end

tf = ishold(ax);

ls = plot(varargin{:});
hold(ax,'on');

fd = fp{1};
fc = fp{2};
fa = fp{3};

fd = validatetype(fd,ls);

nf = size(fd,1);

fc = validatecolor(fc,fd,ls,nf);

fa = validatealpha(fa,nf);

ps = gobjects(nf,1);

for i = 1:nf
    
    x = cell(1,2);
    y = cell(1,2);

    for j = 1:2
        switch fd(i,j)
            case {-2,-1}
                y{j} = ylim;
                y{j} = y{j}(abs(fd(i,j)));
            case 0
                y{j} = 0;
            otherwise
                x{j} = ls(fd(i,j)).XData;
                y{j} = ls(fd(i,j)).YData;
        end
    end
    
    if isequal(x{1},x{2})
        x = x{1};
    elseif isempty(x{1})
        x = x{2};
        y{1} = y{1} * ones(size(x));
    elseif isempty(x{2})
        x = x{1};
        y{2} = y{2} * ones(size(x));
    else
        x = sort([x{1} x{2}]);
        y{1} = interp1(x{1},y{1},x,'linear','extrap');
        y{2} = interp1(x{2},y{2},x,'linear','extrap');
    end

    x0 = [x(1) zcross(x,y{1} - y{2}) x(end)];
    y0 = interp1(x,y{1},x0);

    for j = 0:length(x0)-2

        idx = x >= x0(j+1) & x <= x0(j+2) & y{1} >= y{2};
        if all(~idx), continue; end

        xv = [x0(j+1) x(idx) x0(j+2) fliplr(x(idx))];
        yv = [y0(j+1) y{1}(idx) y0(j+2) fliplr(y{2}(idx))];

        ps(i) = fill(ax,xv,yv,fc(i,:),'LineStyle','none','FaceAlpha',fa(i));

    end
end

if tf == 0
    hold(ax,'off');
end

if nargout == 1
    h = [ls;ps];
end

end


function z = zcross(x,y)

c = y > 0;

d = abs(diff(c));
p1 = find(d == 1);  
p2 = p1 + 1;        

z = x(p1) + abs(y(p1)) ./ (abs(y(p1)) + abs(y(p2))) .* (x(p2) - x(p1));

end


function fd = validatetype(fd,ls)

if isempty(fd)
    fd = [(1:length(ls))' zeros(size(ls))];
    fd = [fd;fliplr(fd)];
    fd = fd([1:2:length(fd) 2:2:length(fd)],:);
end

if iscell(fd)
    tmp = zeros(size(fd));
    for i = 1:numel(fd)
        if ischar(fd{i})
            tmp(i) = str2ind(validatestring(fd{i},{'axis','bottom','top'},'shade','FillType'));
        else
            validateattributes(fd{i},{'numeric'},{'scalar'},'shade','FillType');
            tmp(i) = fd{i};
        end
    end
    fd = tmp;
end

validateattributes(fd,{'numeric'},{'integer','size',[nan 2],'>=',-2,'<=',length(ls)},'shade','FillType');

end


function fc = validatecolor(fc,fd,ls,nf)

if isempty(fc)
    fc = zeros(nf,3);
    for i = 1:nf
        if fd(i,1) <= 0
            fc(i,:) = ls(fd(i,2)).Color;
        elseif fd(i,2) <= 0
            fc(i,:) = ls(fd(i,1)).Color;
        else
            fc(i,:) = mean([ls(fd(i,1)).Color;ls(fd(i,2)).Color],1);
        end
    end
end

if ischar(fc)
    fc = {fc};
    fc = repmat(fc,nf,1);
elseif (iscell(fc) && numel(fc) == 1) || (~iscell(fc) && size(fc,1) == 1)
    fc = repmat(fc,nf,1);
end

if iscell(fc)
    validateattributes(fc,{'cell'},{'vector','numel',nf},'shade','FillColor');
    tmp = zeros(numel(fc),3);
    for i = 1:numel(fc)
        if ischar(fc{i})
            tmp(i,:) = str2rgb(validatestring(fc{i},{'y','m','c','r','g','b','w','k','yellow','magenta','cyan','red','green','blue','white','black'},'shade','FillColor'));
        else
            validateattributes(fc{i},{'numeric'},{'vector','numel',3},'shade','FillColor');
            if iscolumn(fc{i})
                fc{i} = fc{i}';
            end
            tmp(i,:) = fc{i};
        end
    end
    fc = tmp;
end     

validateattributes(fc,{'numeric'},{'real','size',[nf 3],'>=',0,'<=',1},'shade','FillColor');

end


function fa = validatealpha(fa,nf)

if isempty(fa)
    fa = 0.3 * ones(nf,1);
end

if length(fa) == 1
    fa = repmat(fa,nf,1);
end

if isrow(fa)
    fa = fa';
end

validateattributes(fa,{'numeric'},{'real','vector','numel',nf,'>=',0,'<=',1},'shade','FillAlpha');

end


function n = str2ind(s)

switch s
    case 'axis'
        n = 0;
    case 'bottom'
        n = -1;
    case 'top'
        n = -2;
end

end


function n = str2rgb(s)

switch s
    case {'y','yellow'}
        n = [1 1 0];
    case {'m','magenta'}
        n = [1 0 1];
    case {'c','cyan'}
        n = [0 1 1];
    case {'r','red'}
        n = [1 0 0];
    case {'g','green'}
        n = [0 1 0];
    case {'b','blue'}
        n = [0 0 1];
    case {'w','white'}
        n = [1 1 1];
    case {'k','black'}
        n = [0 0 0];
end


end
