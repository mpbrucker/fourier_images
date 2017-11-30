function [dictY, dictCB, dictCR] = get_dicts(y, cb, cr)
    tabY = [tabulate(reshape(y,1,[])); 1000 0 0];
    tabCB = [tabulate(reshape(cb,1,[])); 1000 0 0];
    tabCR = [tabulate(reshape(cr,1,[])); 1000 0 0];
    
    dictY = huffmandict(tabY(:,1), tabY(:,3)./100);
    dictCB = huffmandict(tabCB(:,1), tabCB(:,3)./100);
    dictCR = huffmandict(tabCR(:,1), tabCR(:,3)./100);
    
end