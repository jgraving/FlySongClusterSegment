function makePeakPlot(data,peakIdxGroup,toPlot,xRange)
    %makes peak plot (data, with lines, colored differently for different
    %templates)
    
    %Inputs:
    
    %data -> 1-D sounds trace
    %peakIdxGroup -> L x 1 cell array of peak values outputted from
    %                   createTemplates.m
    %toPlot -> 1-D array of the templates to plot (i.e. [1 3 4 5])

    
    if nargin < 3 || isempty(toPlot)
        toPlot = 1:length(peakIdxGroup);
    end
    
    
    cs = 'r--k--g--m--c--r-.k-.g-.m-.c-.r-*k-*g-*m--c-*r-^k-^g-^m-^c-^';
   
    highVal = ceil(max(data)*2)/2;
    lowVal = floor(min(data)*2)/2;
    
    
    L = length(toPlot);
    
    if nargin < 4 || isempty(xRange) || length(xRange) ~= length(data)
        plot(data,'b-');
    else
        plot(xRange,data);
    end
    hold on
    
    for i=1:L
        j = toPlot(i);
        for k=1:length(peakIdxGroup{j})
            plot([peakIdxGroup{j}(k) peakIdxGroup{j}(k)],[lowVal highVal],cs(3*i-2:3*i))
        end
    end
    
    hold off
   